;;This find focus on changes such as WindowSize, Appearance and so on.

;;To disable the menu-bar-mode
(menu-bar-mode -1)
;;To disable the scrollbar, use the following line:
(toggle-scroll-bar -1)
;;To disable the toolbar, use the following line:
(tool-bar-mode -1)

(let ((filename (concat user-emacs-directory "hello.txt")))
  (when (file-exists-p filename)
    (let ((scratch-buf (get-buffer "*scratch*")))
      (when scratch-buf
        (with-current-buffer scratch-buf
          (erase-buffer)
          (insert-file-contents filename))))))

(let ((file "~/.emacs.d/hello.txt"))
  (when (file-exists-p file)
    (setq initial-scratch-message
      (with-temp-buffer
        (insert-file-contents file)
        (buffer-string)))))

(global-set-key (kbd "C-z") 'undo)


;; Glolbal Set: comment/uncomment region:
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

;; Setup linum mode
(require 'linum)
(setq linum-format
      (lambda (line)
        (propertize (number-to-string (1- line)) 'face 'linum)))

(global-linum-mode 1)



;; Starting emacs at fullscreen:
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Add youtube quick search function:
(defun er-youtube ()
  "Search YouTube with a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.youtube.com/results?search_query="
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Search YouTube: "))))))

(global-set-key (kbd "C-c y") #'er-youtube)

;; Add wikipedia quick search function:

(defun er-wikipedia ()
  "Search YouTube with a query or region if any."
  (interactive)
  (browse-url
   (concat
    "https://wikipedia.org/w/index.php?search="
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Search Wikipedia: "))))))

(global-set-key (kbd "C-c w") #'er-wikipedia)


;; Set keybinding for save:
(global-set-key (kbd "C-c s") 'save-buffer )
(global-set-key (kbd "C-x s") 'save-buffer )
(global-set-key (kbd "C-c C-s") 'save-buffer )



;; Toggle between fullscreen and window mode
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)
(provide 'general)
