import { NativeModules } from 'react-native'

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

export default new StripeNative()
