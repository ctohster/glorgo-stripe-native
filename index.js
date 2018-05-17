import PropTypes from 'prop-types'
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

const interfance = {
  name: 'GLGStripeCardIcon',
  propTypes: {
    brand: PropTypes.string
  }
}
const GLGStripeCardIcon = requireNativeComponent('GLGStripeCardIcon', null)

export const StripeCardIcon = ({brand}) => <GLGStripeCardIcon brand={brand} style={{height: 20, width: 32}}/>
export const StripeNativeManager = new StripeNative()
