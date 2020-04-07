
(add-to-list 'load-path "~/.emacs.d/config/javascript-bundle.el")
(add-to-list 'load-path "~/.emacs.d/config/php-bundle.el")
(add-to-list 'load-path "~/.emacs.d/config/yaml-bundle.el")
(add-to-list 'load-path "~/.emacs.d/config/html-css-bundle.el")
;;===================== Yasnippet =========
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (yasnippet-snippets ## yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; For yas - snippet generator
(require 'yasnippet)
(yas-global-mode 1)
(global-set-key (kbd "C-c C-y") 'yas-insert-snippet)
;;===================== Company-mode ==========================
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
(add-hook 'after-init-hook 'global-company-mode)

;;===================== Beacon: https://github.com/Malabarba/beacon
(beacon-mode 1)
;;===================== Setup Helm:
(require 'helm-config)
(require 'helm)
(global-set-key (kbd "C-x d") 'helm-find-files)
(global-set-key (kbd "C-x C-d") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x f") 'helm-find-files)


(global-set-key (kbd "M-x") 'helm-M-x)
(customize-set-variable 'helm-ff-lynx-style-map t)
(with-eval-after-load 'helm-files
(define-key helm-find-files-map (kbd "C-j") 'helm-find-files-up-one-level)
(define-key helm-find-files-map (kbd "C-l") 'helm-execute-persistent-action))
(with-eval-after-load 'helm)

;;===================== Setup Emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation
(global-set-key (kbd "C-<tab>") 'emmet-expand-line)

;;===================== Setup Projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
(setq projectile-project-search-path '("~/Projects/"))
(projectile-mode +1)

;;===================== Setup ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)


;;==================== Setup magit
(global-set-key (kbd "C-x g s") 'magit-status)
(global-set-key (kbd "C-x g p") 'magit-push-popup)
;;==================== Setup electric-pair-mode
(electric-pair-mode 1)
(push '(?\' . ?\') electric-pair-pairs)      ; Automatically pair single-quotes

;;==================== Setup centaurs-tab
(require 'centaur-tabs)
(centaur-tabs-mode t)
(global-set-key (kbd "C-c -")  'centaur-tabs-backward)
(global-set-key (kbd "C-c =") 'centaur-tabs-forward)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-bar 'over)

;;===================== Setup highlight-parentheses
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;;===================== Setup zoom: github.com/cyrus-and/zoom
(custom-set-variables
 '(zoom-mode t))
(custom-set-variables
 '(zoom-size '(0.618 . 0.618)))

;;==================== Setup google-this: https://github.com/Malabarba/emacs-google-this
(global-set-key (kbd "C-c C-g") 'google-this)
(google-this-mode 1)

;;================ Setup company-lsp
(require 'company-lsp)
(push 'company-lsp company-backends)

;; ;;===================== Setup lsp-mode
(require 'lsp-mode)

(global-set-key (kbd "C-c l s") 'lsp)
(add-hook 'php-mode-hook #'lsp)
(add-hook 'web-mode-hook' #'lsp)

;; ;; Auto open lsp when the detected file matched any given extension

;; ;; ===================== Setup lsp-ui-mode
;; (setq lsp-auto-configure t)
  (setq lsp-ui-doc-max-height 13
        lsp-ui-doc-max-width 80
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-doc-header t
        lsp-ui-doc-include-signature t
        lsp-ui-doc-position 'top
        lsp-ui-doc-use-webkit nil
        lsp-ui-flycheck-enable t
        lsp-ui-imenu-kind-position 'left
        
        ;; fix for completing candidates not showing after “Enum.”:
        company-lsp-match-candidate-predicate #'company-lsp-match-candidate-prefix
        )




;;==================== Setup dashboard: https://github.com/emacs-dashboard/emacs-dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-banner-logo-title "Have a good day Mr.Son, good luck and do not forget you have a tons of work to do!")

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(custom-set-variables
       ;; custom-set-variables was added by Custom.
       ;; If you edit it by hand, you could mess it up, so be careful.
       ;; Your init file should contain only one such instance.
       ;; If there is more than one, they won't work right.
 '(dashboard-footer-messages  (read-lines "~/.emacs.d/footnotes-dashboard.txt")))
 

;;=================== Setup page-break-lines: https://github.com/purcell/page-break-lines
(require 'page-break-lines)
(turn-on-page-break-lines-mode)
;;================== Setup intent-guide: https://github.com/zk-phi/indent-guide
(require 'indent-guide)
(indent-guide-global-mode)
;;================= Setup smart-tabs-mode
(smart-tabs-insinuate 'c 'javascript)

;;================= Setup smart-semicolons
(require 'smart-semicolon)
(add-hook 'php-mode-hook #'smart-semicolon-mode)


;;================= Setup neotree
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)


;;================= Synch between neotree and projectile
;; NeoTree can be opened (toggled) at projectile project root
(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

;; need another one for python stuff, since this gets re-bound
(global-set-key (kbd "C-c C-p") 'neotree-project-dir)


(setq neo-autorefresh nil)



;; Setup smooth-scroll https://github.com/aspiers/smooth-scrolling
(require 'smooth-scroll)
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)



(require 'javascript-bundle)
(require 'php-bundle)
(require 'yaml-bundle)
(require 'html-css-bundle)

(provide 'package-manager)
