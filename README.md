# Meetings

**Meetings** organizes meetings: agendas, protocols and follow-up actions, in one local SQLite file. Each project has a meeting time and place; its topics (with root cause, severity, champion and actions) feed a printable Protocol and a shorter Agenda. Styled with **Dave-Standard** (`~/Desktop/Dave-Standard/python_customtkinter`): floating panels, flat icon buttons, dark and light themes. `dave_theme.py`, `icons/` and `icon.png` are copies from there; fix the look in Dave-Standard, then copy the file here.

```
python3 main.py --demo            # sample data in a separate demo database
python3 main.py                   # your data
python3 main.py --theme light     # or dark (default; remembered; sun/moon button in the toolbar)
```

## Install with pipx (from the repo)
```
sudo dnf install pipx python3-tkinter          # once; Tk is not on PyPI
pipx install git+https://github.com/KillGorack/meetings      # or: pipx install /path/to/Meetings
meetings                                  # upgrade: pipx upgrade meetings   remove: pipx uninstall meetings
meetings --install-menu                   # optional: adds it to the applications menu (--remove-menu undoes it)
```
pipx keeps the app in its own private environment, so nothing else on the system is touched; your data (`~/.local/share/meetings`) is never removed. pipx only installs the command, so run `meetings --install-menu` once to add the menu entry (run `--remove-menu` before `pipx uninstall`).

## Data
- **Project:** the top-level subject or meeting series (for example Logistics, Production). Every topic belongs to one. It also holds the meeting's **When** and **Where**, shown on the Protocol and Agenda. It is the first dropdown on the topic form, a filter on every list, and the title of every exported PDF. You maintain the list in Settings.
- **Topic:** title, severity (Low, Medium, High by default), category and sub-category, champion, status (Open or Closed), description, root cause, and any number of pictures. **Created** is set once; **Updated** moves whenever the topic, its actions or its pictures change. Closing stamps the closed date, and warns if actions are not Verified yet.
- **Severity levels** are an editable list in Settings: a name, a hex color and an order. The color is the dot on lists, the form and the PDFs. A level in use can't be removed.
- **Action** (any number per topic, reorderable): what, who, due date, stage (Planning, Defined, Implemented, Verified). An action is open until Verified.
- **Category**, **Sub-category** and **Champion** (people) come from lists you maintain in Settings. An entry that is in use can't be removed.
- File: `~/.local/share/meetings/meetings.db` (Windows: `%LOCALAPPDATA%\Meetings`). Each topic also has a folder, `TS-0003`, inside the *topic files folder* you choose in Settings (default: `meetings-files` beside the database). The app keeps its pictures in that folder's `pictures` sub-folder; everything else in it is yours (evidence, minutes, spreadsheets). The app never reads, changes or deletes your own files, even when you delete the topic. Back up the database file and the files folder together.

## Screens
**Topics** (open by default; search, Project and Open/Closed/All filters, sortable table; topic detail with form, actions, pictures) · **Protocol** (the meeting record: Project > Category > Sub-category > Topic with description and actions) · **Agenda** (the same grouping, topic titles only, with attendees) · **Settings** (theme, lists, severity levels, topic files folder). Shortcuts: Ctrl+N new topic, Ctrl+F search, Ctrl+, settings, Ctrl +/-/0 text size, Esc back. Feedback appears in the toolbar.

## PDF
Export the **Protocol** and the **Agenda** for a project (with its meeting time and place), the topic list as filtered, or a single topic sheet from its detail screen (details, description, root cause, actions, pictures). Needs `sudo dnf install python3-reportlab`. The save-PDF and add-pictures dialogs open in the folder you used last time.

## Files
`main.py` app shell and navigation · `views.py` screens · `db.py` storage · `pdf_export.py` PDF output · `widgets.py` small dialogs · `dave_theme.py` + `icons/` the look (from Dave-Standard).
