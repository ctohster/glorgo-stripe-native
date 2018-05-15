import { NativeModules } from 'react-native'

const {GLGStripeNative} = NativeModules

class StripeNative {
  init = (options = {}) => {
    this.options = options
  }

  openAddCardSourceView = () => {
    return GLGStripeNative.openAddCardSourceView(this.options)
  }
}

export default new StripeNative()
