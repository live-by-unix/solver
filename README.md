# solver — The Ultimate File Reset & Edit Utility
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Shell](https://img.shields.io/badge/shell-bash-121011.svg)
![Status](https://img.shields.io/badge/status-stable-brightgreen.svg)

`solver` is a fast, minimal, and powerful Bash utility that replaces the repetitive workflow of deleting a file, backing it up, injecting templates, and reopening it in your editor.  
It compresses multiple daily actions into a single command.

You run:

```bash
solver file.ext
```

And instantly get:

- automatic directory creation  
- timestamped backup  
- optional undo  
- optional logging  
- filetype‑based template injection  
- editor auto‑detection  
- clean file opened instantly  

---

## Features

- **Timestamped backups** (`file.ext.YYYYMMDD_HHMMSS.bak`)
- **Undo support** (`solver undo`)
- **Filetype templates** (`~/.solver_templates/<ext>`)
- **Logging** (`~/.solver.log`)
- **Editor auto‑detection** (`$EDITOR` → fallback to nano)
- **Directory auto‑creation**
- **Flags for no‑backup, logging, undo tracking**
- **Single unified script**

---

## Installation

### 1. Save the script

Save the unified script as:

```
~/bin/solver
```

### 2. Make it executable

```bash
chmod +x ~/bin/solver
```

### 3. Ensure `~/bin` is in your PATH

Add to your shell config:

```bash
export PATH="$HOME/bin:$PATH"
```

Reload:

```bash
source ~/.bashrc
```

---

## Usage

### Basic usage

```
solver <file>
```

Example:

```bash
solver script.py
```

### Undo last operation

```bash
solver undo
```

---

## ⚙️ Flags

### `-n` — No backup

```bash
solver -n file.txt
```

### `-l` — Log the action

```bash
solver -l file.txt
```

Logs to:

```bash
~/.solver.log
```

### `-u` — Track undo

```bash
solver -u file.txt
```

Stores the last backup path in:

```bash
~/.solver_last
```

---

## Templates

Create the template directory:

```
mkdir -p ~/.solver_templates
```

Add templates by extension:

```
~/.solver_templates/py
~/.solver_templates/sh
~/.solver_templates/html
```

When you run:

```
solver main.py
```

The contents of `~/.solver_templates/py` are inserted automatically.

---

## Editor Detection

`solver` uses:

1. `$EDITOR` if set  
2. otherwise `nano`

Set your preferred editor:

```bash
export EDITOR=vim
```

---

## Logging

If you use `-l`, solver logs entries like:

```
2026-05-22 16:07:12 solver file.txt
```

Stored in:

```
~/.solver.log
```

---

## Examples

### Fresh file with backup

```bash
solver notes.md
```

### Fresh file with no backup

```bash
solver -n notes.md
```

### Fresh file with logging + undo

```bash
solver -lu config.yaml
```

### Undo last operation

```bash
solver undo
```

---

## Project Structure (recommended)

```
solver
README.md
~/.solver_templates/
    py
    sh
    html
~/.solver.log
~/.solver_last
```

---

## Contributing

Pull requests are welcome.  
If you want to add features like:

- encryption  
- git integration  
- AI‑generated templates  
- auto‑commit  
- preview mode  

open an issue or PR.

---

## License

MIT License.  
Free to use, modify, and distribute.

---

## If you like this tool…

Star the repo.  
Share it.  
Or build something even crazier with it.

