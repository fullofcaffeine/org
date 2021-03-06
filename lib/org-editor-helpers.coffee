{Point} = require 'atom'

module.exports =
class OrgEditorHelpers
  inOrgFile: (ed, e, fn) ->
    # sometimes file is null
    if (ed.buffer.file &&
        ed.buffer.file.path.endsWith('.org'))
      fn(ed)
    else
      e.abortKeyBinding()

  getCurrentLine: (ed) =>
    row = @getCurrentRow ed
    return @getLineAtRow ed, row

  getLineAtRow: (ed, row) ->
    return ed.getBuffer().lineForRow(row)

  getCurrentRow: (ed) ->
    return ed.getLastCursor().getBufferRow()

  replaceCurrentLine: (ed, line) ->
    point = ed.getLastCursor().getBufferPosition()
    ed.selectLine()
    ed.insertText line + '\n'
    ed.getLastCursor().setBufferPosition(point)

  moveCursorUp: (ed) =>
    row = @getCurrentRow ed
    @setCurrentRow(ed, row - 1)

  moveCursorDown: (ed) =>
    row = @getCurrentRow ed
    @setCurrentRow(ed, row + 1)

  setCurrentRow: (ed, row) =>
    pos = @getCursorPosition ed
    @setCursorPosition ed, row, pos.column

  setCursorPosition: (ed, row, column) ->
    ed.getCursor().setBufferPosition(new Point(row, column))

  getCursorPosition: (ed) ->
    return ed.getCursor().getBufferPosition()

  destroy: ->

  serialize: ->
