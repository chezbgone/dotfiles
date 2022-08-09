#!/usr/bin/env python3

def set_colored_prompt():
  import sys

  # lifted from https://github.com/tartley/colorama/blob/master/colorama/ansi.py
  CSI = '\033['
  RL_PROMPT_BEGIN_IGNORE = '\x01'
  RL_PROMPT_END_IGNORE = '\x02'
  # \x01 and \x02 are needed for readline to ignore escape sequences
  # https://stackoverflow.com/questions/33683744/change-python-interactive-prompt
  GREEN = RL_PROMPT_BEGIN_IGNORE + CSI + str(32) + 'm' + RL_PROMPT_END_IGNORE
  RESET = RL_PROMPT_BEGIN_IGNORE + CSI + str(39) + 'm' + RL_PROMPT_END_IGNORE

  sys.ps1 = GREEN + '> ' + RESET
  sys.ps2 = GREEN + '⋯ ' + RESET
set_colored_prompt()
del set_colored_prompt

def welcome_message():
  import platform
  python_info = f'{platform.python_implementation()} {platform.python_version()}'
  python_compiler = platform.python_compiler()
  print(f'{python_info} [built with {python_compiler}]')
welcome_message()
del welcome_message

def disable_history():
  import readline
  readline.write_history_file = lambda *_: None
disable_history()
del disable_history

