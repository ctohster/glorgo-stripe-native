package com.glorgo.reactnative;

import android.widget.ImageView;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.stripe.android.model.Card;

import javax.annotation.Nullable;

import static com.stripe.android.model.Card.BRAND_RESOURCE_MAP;

public class StripeNativeCardIconManager extends SimpleViewManager<ImageView> {

    private static final String REACT_CLASS = "GLGStripeCardIcon";

    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    protected ImageView createViewInstance(ThemedReactContext reactContext) {
        ImageView imageView = new ImageView(reactContext);
        imageView.setImageResource(BRAND_RESOURCE_MAP.get(Card.UNKNOWN));
        return imageView;
    }

    @ReactProp(name = "brand")
    public void setBrand(ImageView imageView, @Nullable String brand) {
        imageView.setImageResource(BRAND_RESOURCE_MAP.get(brand));
    }
}
