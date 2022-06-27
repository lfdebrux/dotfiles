-- Acme editor color scheme
local lexers = vis.lexers

lexers.STYLE_DEFAULT = 'back:#ffffeb,fore:black'
lexers.STYLE_NOTHING = 'back:white'
lexers.STYLE_CLASS = 'fore:black'
lexers.STYLE_COMMENT = 'fore:black'
lexers.STYLE_CONSTANT = 'fore:black'
lexers.STYLE_DEFINITION = 'fore:black'
lexers.STYLE_ERROR = 'fore:red'
lexers.STYLE_FUNCTION = 'fore:black'
lexers.STYLE_KEYWORD = 'fore:black'
lexers.STYLE_LABEL = 'fore:black'
lexers.STYLE_NUMBER = 'fore:black'
lexers.STYLE_OPERATOR = 'fore:black'
lexers.STYLE_REGEX = 'fore:black'
lexers.STYLE_STRING = 'fore:black'
lexers.STYLE_PREPROCESSOR = 'fore:black'
lexers.STYLE_TAG = 'fore:black'
lexers.STYLE_TYPE = 'fore:black'
lexers.STYLE_VARIABLE = 'fore:black'
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = 'fore:black'
lexers.STYLE_IDENTIFIER = 'fore:black'

lexers.STYLE_LINENUMBER = 'fore:black'
lexers.STYLE_LINENUMBER_CURSOR = lexers.STYLE_LINENUMBER
lexers.STYLE_CURSOR = 'reverse'
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',fore:#90ece9'
lexers.STYLE_CURSOR_LINE = 'underlined'
lexers.STYLE_COLOR_COLUMN = 'back:#e6ffff'
lexers.STYLE_SELECTION = 'back:#eaed8d'
lexers.STYLE_STATUS = 'back:#e6ffff'
lexers.STYLE_STATUS_FOCUSED = 'back:#e6ffff,bold'
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''
