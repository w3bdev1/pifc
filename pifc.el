;;; pifc.el --- Paste Image From Clipboard in Org-Mode or Markdown-Mode                        -*- lexical-binding: t; -*-

;; Author: W3b Dev <w3bdev@protonmail.com>
;; Homepage: https://github.com/w3bdev1/pifc
;; Version: 1.0
;; Package-Requires: ((emacs "25.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; It allows to paste image from clipboard to org or markdown file.
;; The images are saved in the path specified in pifc-relative-path
;; variable relative to the current buffer.


;;; Code:

(defvar pifc-relative-path "./_resources"
  "It is the relative path with respect to current buffer where pifc saves clipboard messages.")

;;;###autoload
(defun org-paste-image-from-clipboard ()
  "Paste image from clipboard to an org file.
Specify the relative path with respect to your file in the variable `pifc-relative-path'."
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

;;;###autoload
(defun md-paste-image-from-clipboard ()
  "Paste image from clipboard to a markdown file.
Specify the relative path with respect to your file in the variable `pifc-relative-path'."
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

(provide 'pifc)
;;; pifc.el ends here
