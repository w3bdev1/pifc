# Paste Image From Clipboard (PIFC)
- It allows to paste clipboard image to `org` or `markdown` file in Emacs.
- Currently supported for GNU/Linux system only.
- Images are saved in date-time format.

### Dependency
- `xlip` in host system.

### Configuration
- By default PIFC saves images in `_resources` directory in the current buffer path, i.e., relative path of `./_resources`
- Users can customize the relatove path through varibale `pifc-relative-path`.
- To save images under `attachments` directory in the current buffer path → `(setq pifc-relative-path "./attachments")`.
- To save images under `_resources` directory but 2 directory above the current buffer path → `(setq pifc-relative-path "../../_resources")`

### How to use
*For Org File*
- You have interactive function `org-paste-image-from-clipboard`. So you can use `M-x org-paste-image-from-clipboard RET`.
- To create a keyboard mapping → `(define-key org-mode-map (kbd "<Your-Key-Mapping>") 'org-paste-image-from-clipboard)`.

*For Markdown File*
- Similar to org file, `M-x md-paste-image-from-clipboard RET`
