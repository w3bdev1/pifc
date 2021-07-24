(defun org-paste-image-from-clipboard ()
  "Paste image from clipboard to an org file.\nSpecify the relative path with respect to your file in the variable pifc-relative-path."
  (interactive)
  (let ((filename (concat (format-time-string "%Y%m%d-%H%M%S") ".png"))
	 (absolute-path (concat default-directory pifc-relative-path)))
    (if (eq system-type 'gnu/linux)
	(if (gui-get-selection 'CLIPBOARD 'image/png)
	    (progn
	      (shell-command (concat "mkdir -p " absolute-path))
	      (shell-command (concat "xclip -sel clipboard -t image/png -o > " absolute-path "/" filename))
	      (insert (concat "[[" pifc-relative-path "/" filename "]]" ))
	      (message (concat "Image saved to: " absolute-path "/" filename)))
	  (message "Clipboard does not contain image"))
      (message "Currently supported for GNU/Linux system only"))))

(defun md-paste-image-from-clipboard ()
  "Paste image from clipboard to a markdown file.\nSpecify the relative path with respect to your file in the variable pifc-relative-path."
  (interactive)
  (let ((filename (concat (format-time-string "%Y%m%d-%H%M%S") ".png"))
	 (absolute-path (concat default-directory pifc-relative-path)))
    (if (eq system-type 'gnu/linux)
	(if (gui-get-selection 'CLIPBOARD 'image/png)
	    (progn
	      (shell-command (concat "mkdir -p " absolute-path))
	      (shell-command (concat "xclip -sel clipboard -t image/png -o > " absolute-path "/" filename))
	      (insert (concat "![](" pifc-relative-path "/" filename ")" ))
	      (message (concat "Image saved to: " absolute-path "/" filename)))
	  (message "Clipboard does not contain image"))
      (message "Currently supported for GNU/Linux system only"))))
