;;This find focus on changes such as WindowSize, Appearance and so on.

;;To disable the menu-bar-mode
(menu-bar-mode -1)
;;To disable the scrollbar, use the following line:
(toggle-scroll-bar -1)
;;To disable the toolbar, use the following line:
(tool-bar-mode -1)

(let ((filename "~/.emacs.d/hello.txt"))
  (when (file-exists-p filename)
    (setq initial-buffer-choice filename)))

(provide 'general)
