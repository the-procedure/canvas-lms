define [
  'react'
  'compiled/react/shared/utils/withReactDOM'
], (React, withReactDOM) ->

  ProgressBar = React.createClass
    displayName: 'ProgressBar'

    propTypes:
      progress: React.PropTypes.number.isRequired
      'aria-label': React.PropTypes.string #Used as an override if needed.

    barProgress: (progress) ->
      return 100 if progress > 100
      return progress

    render: withReactDOM ->
      almostDone = ''
      almostDone = ' almost-done' if @props.progress == 100
      div ref: 'container', className: 'progress-bar__bar-container' + almostDone,
        div
          ref: 'bar'
          className: 'progress-bar__bar' + almostDone
          role: 'progressbar'
          'aria-valuenow': @barProgress(@props.progress)
          'aria-valuemin': 0
          'aria-valuemax': 100
          'aria-label': @props['aria-label'] if @props['aria-label']
          style:
            width: @barProgress(@props.progress) + '%'
