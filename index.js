import React from 'react'
import { NativeModules, requireNativeComponent } from 'react-native'

const {GLGStripeNative} = NativeModules

class StripeNative {
  init = (options = {}) => {
    this.options = options
  }

  USER_CANCELLED = GLGStripeNative.USER_CANCELLED

  openAddCardSourceView = () => {
    return GLGStripeNative.openAddCardSourceView(this.options)
  }
}

const NativeCardIcon = requireNativeComponent('GLGStripeCardIcon', null)
const StripeCardIcon = () => <NativeCardIcon style={{height: 20, width: 32}}/>

export default {
  StripeNativeManager: new StripeNative(),
  StripeCardIcon
}
