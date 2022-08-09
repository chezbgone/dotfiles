from itertools import islice
from pathlib import Path
# regex instead of re for variable length lookbehinds
from regex import DOTALL, Match, fullmatch, sub
from string import Template
from typing import Callable, Mapping, Optional

# GLOBAL VARS / CONFIG

WIKI_ROOT: Path = Path('/home/jason/Dropbox/vimwiki')
MAIN_FILE: str = 'main.wiki'
JOURNAL_SUBDIRECTORY: Path = Path('journal')
PEOPLE_SUBDIRECTORY: Path = Path('people')

# UTILS

def format_path_to(p: Path, display: Optional[str] = None) -> str:
  template_str = '[[/$p]]' if display is None else f'[[/$p|{display}]]'
  template = Template(template_str)
  return template.substitute(p=str(p.relative_to(WIKI_ROOT)))

def format_path_trim(path: Path) -> str:
  return format_path_to(path, display=path.stem)

# VAR_DICT

var_formatters: Mapping[str, str] = {}

def set_var(var: str):
  def dec(f: Callable[[], str]):
    var_formatters[var] = f()
    return f
  return dec

# CONTENT

@set_var('journal_list')
def _() -> str:
  journal_dir = WIKI_ROOT / JOURNAL_SUBDIRECTORY
  def is_entry(p: Path) -> bool:
    return bool(fullmatch(r'\d\d\d\d-\d\d-\d\d\.wiki', p.name))
  entries = filter(is_entry, journal_dir.iterdir())
  return '\n'.join(format_path_trim(p) for p in islice(entries, 5))

@set_var('people_list')
def _() -> str:
  people_dir = WIKI_ROOT / PEOPLE_SUBDIRECTORY
  return '\n'.join(format_path_trim(p) for p in people_dir.iterdir())

# MAIN

if __name__ == '__main__':
  main_file = WIKI_ROOT / MAIN_FILE
  with main_file.open('r') as f:
    main = f.read()
  def replace(match: Match[str]) -> str:
    return var_formatters[match.group(1)] + '\n'
  new_main = sub(r'(?<={- \$(\w*)\n).*?(?=-})', replace, main, flags=DOTALL)
  with main_file.open('w') as f:
    f.write(new_main)
