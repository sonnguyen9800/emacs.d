(add-to-list 'load-path "~/.emacs.d/config/")
(add-to-list 'load-path "~/.emacs.d/appearance/")
;; Hide warning from the depecration of "cl" package

(setq byte-compile-warnings '(cl-functions))

;; Melpa - Package Manager
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(require 'general)
(require 'init-package.el)
(require 'package-manager)

(require 'theme)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-footer-messages (read-lines "~/.emacs.d/footnotes-dashboard.txt"))
 '(helm-ff-lynx-style-map t)
 '(inhibit-startup-screen t)
 '(js-indent-level 4)
 '(package-selected-packages
   (quote
    (web-beautify lsp-ui company yasnippet-snippets ## yasnippet)))
 '(zoom-mode t nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


