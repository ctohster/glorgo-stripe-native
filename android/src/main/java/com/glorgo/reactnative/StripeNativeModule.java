package com.glorgo.reactnative;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.model.Source;
import com.stripe.android.view.AddSourceActivity;

import static com.stripe.android.view.AddSourceActivity.EXTRA_NEW_SOURCE;

public class StripeNativeModule extends ReactContextBaseJavaModule {
    private static final int OPEN_ADD_CARD_SOURCE = 1;
    private Promise openAddCardSourceViewPromise;

    private final ActivityEventListener mActivityEventListener = new BaseActivityEventListener() {

        @Override
        public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent intent) {
            if (requestCode == OPEN_ADD_CARD_SOURCE) {
                if (openAddCardSourceViewPromise != null) {
                    if (resultCode == Activity.RESULT_CANCELED) {
                        openAddCardSourceViewPromise.resolve("failed");
                    } else if (resultCode == Activity.RESULT_OK) {
                        Bundle bundle = intent.getExtras();
                        if (bundle == null) {
                            openAddCardSourceViewPromise.reject("No image data found");
                        } else {
                            String sourceString = bundle.getString(EXTRA_NEW_SOURCE);
                            Source source = Source.fromString(sourceString);
                            openAddCardSourceViewPromise.resolve(source.getId());
                        }
                    }

                    openAddCardSourceViewPromise = null;
                }
            }
        }
    };

    public StripeNativeModule(ReactApplicationContext reactContext) {
        super(reactContext);

        reactContext.addActivityEventListener(mActivityEventListener);
    }

    @Override
    public String getName() {
        return "GLGStripeNative";
    }

    @ReactMethod
    public void openAddCardSourceView(ReadableMap options, Promise promise) {
        openAddCardSourceViewPromise = promise;
        ReactApplicationContext currentContext = getReactApplicationContext();
        PaymentConfiguration.init(options.getString("publishableKey"));
        Intent intent = AddSourceActivity.newIntent(currentContext, false, false);
        Activity currentActivity = getCurrentActivity();
        currentActivity.startActivityForResult(intent, OPEN_ADD_CARD_SOURCE);
    }
}
