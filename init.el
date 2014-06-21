(setq projectile-keymap-prefix (kbd "C-c C-p"))
(global-set-key (kbd "M-?") (lambda () ;; cheatsheet ;)
                              (interactive)
                              (find-file "~/.emacs.d/init.el")
                              (beginning-of-buffer)
                              ))
(global-set-key (kbd "C-c p f") 'projectile-find-file)
(global-set-key (kbd "C-c p F") 'projectile-find-file-other-window)
(global-set-key (kbd "C-c p d") 'projectile-find-dir)
(global-set-key (kbd "C-c p D") 'projectile-find-dir-other-window)
(global-set-key (kbd "C-c C-c d") 'projectile-dired)
(global-set-key (kbd "C-c p b") 'projectile-switch-to-buffer)
(global-set-key (kbd "C-c p a") 'projectile-ag)
(global-set-key (kbd "C-c p i") 'projectile-invalidate-cache)
(global-set-key (kbd "C-c p k") 'projectile-kill-buffers)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
(global-set-key (kbd "C-c p s") 'projectile-save-project-buffers)
(global-set-key (kbd "C-c p r") 'projectile-recentf)
(global-set-key (kbd "C-c p R") 'recentf-projectile-find-file)
(global-set-key (kbd "C-c p z") 'zoom-window-zoom)
(global-set-key (kbd "C-c p l") 'linum-mode)

(global-set-key (kbd "C-c b") 'ace-jump-buffer)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c a c") 'ace-jump-char-mode)
(global-set-key (kbd "C-c a l") 'ace-jump-line-mode)
(global-set-key (kbd "C-c a b") 'ace-jump-mode-pop-mark)

(global-set-key (kbd "C-q") 'bury-buffer)
(global-set-key (kbd "C-c Q") 'switch-to-previous-buffer)

(global-set-key (kbd "C-c f r") 'rename-file-and-buffer)
(global-set-key (kbd "C-c f d") 'delete-file-and-buffer)

(global-set-key (kbd "C-c s n") 'yas-new-snippet)
(global-set-key (kbd "C-c s i") 'yas-insert-snippet)
(global-set-key (kbd "C-c s v") 'yas-visit-snippet-file)

(global-set-key (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x 0") 'delete-window)
(global-set-key (kbd "C-x 1") 'delete-other-windows)
(global-set-key (kbd "C-x 2") 'split-window-vertically-and-other-window)
(global-set-key (kbd "C-x 3") 'split-window-horizontally-and-other-window)
(global-set-key (kbd "C-x 4") 'balance-windows)
(global-set-key (kbd "C-x 5") 'swap-windows)
(global-set-key (kbd "C-x 6") 'split-window-transpose)
(global-set-key (kbd "TAB") 'smart-tab)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)
(global-set-key (kbd "M-i") 'indent-region-or-buffer)
(global-set-key [(meta n)] 'forward-paragraph)
(global-set-key [(meta p)] 'backward-paragraph)

;;;; * Debugging, Tracing, and Profiling

;; M-: (info "(elisp) Debugging") RET

;; Standard debugger:
;;   M-x debug-on-entry FUNCTION
;;   M-x cancel-debug-on-entry &optional FUNCTION
;; debug &rest DEBUGGER-ARGS
;;   M-x toggle-debug-on-error
;;   M-x toggle-debug-on-quit
;;   setq debug-on-signal
;;   setq debug-on-next-call
;;   setq debug-on-event
;;   setq debug-on-message REGEXP
;;
;; Edebug -- a source-level debugger for Emacs Lisp
;;   M-x edebug-defun (C-u C-M-x) Cancel with eval-defun (C-M-x)
;;   M-x edebug-all-defs -- Toggle edebugging of all definitions
;;   M-x edebug-all-forms -- Toggle edebugging of all forms
;;   M-x edebug-eval-top-level-form

;; Tracing:
;;   M-x trace-function FUNCTION &optional BUFFER
;;   M-x untrace-function FUNCTION
;;   M-x untrace-all

;; Timing and benchmarking:
;; (benchmark-run &optional REPETITIONS &rest FORMS)

;; Emacs Lisp Profiler (ELP)
;;   M-x elp-instrument-package
;;   M-x elp-instrument-list
;;   M-x elp-instrument-function
;;   M-x elp-reset-*
;;   M-x elp-results
;;   M-x elp-restore-all
;;
;; "There's a built-in profiler called ELP. You can try something like
;; M-x elp-instrument-package, enter "vc", and then try finding a file
;; Afterwards, M-x elp-results will show you a profile report.
;; (Note that if the time is instead being spent in non-vc-related
;; functions, this technique will not show it, but you can instrument
;; further packages if you like.)" http://stackoverflow.com/a/6732810/324105

;; CPU & Memory Profiler ('Native Profiler')
;;   M-x profiler-start
;;   M-x profiler-report
;;   M-x profiler-reset
;;   M-x profiler-stop
;;   M-x profiler-*

;; Dope ("DOtemacs ProfilEr. A per-sexp-evaltime profiler.")
;; https://raw.github.com/emacsmirror/dope/master/dope.el
;;   M-x dope-quick-start will show a little introduction tutorial.

;; Spinning:
;; Set debug-on-quit to t
;; When the problem happens, hit C-g for a backtrace.

(defvar personal-dir (file-name-directory load-file-name)
  "The root dir of the emacs configuration.")
(defvar personal-vendor-dir (expand-file-name "vendor" personal-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")
(defvar personal-savefile-dir (expand-file-name "savefile" personal-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar personal-themes-dir (expand-file-name "themes" personal-dir)
  "This folder stores all themes.")
(add-to-list 'custom-theme-load-path personal-themes-dir)

(unless (file-exists-p personal-savefile-dir)
  (make-directory personal-savefile-dir))

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-treshold 50000000)

(defun add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)
        (add-subfolders-to-load-path name)))))

(add-to-list 'load-path personal-vendor-dir)
(add-subfolders-to-load-path personal-vendor-dir)

(require 'llvm-mode)
(add-to-list 'auto-mode-alist
             '("\\.ll\\'" . llvm-mode))
;; +--
;; | PACKAGES
;; +-------------------+
(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; set package-user-dir to be relative to install path
(package-initialize)

(defvar personal-packages
  '(exec-path-from-shell
    ag
    ack-and-a-half
    expand-region
    magit
    multiple-cursors
    gitconfig-mode
    gitignore-mode
    gist
    paredit
    w3m
    )
  "A list of packages to ensure are installed at launch.")


(defun personal-packages-installed-p ()
  "Check if all packages in `personal-packages' are installed."
  (every #'package-installed-p personal-packages))

(defun personal-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package personal-packages)
    (add-to-list 'personal-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun personal-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'personal-require-package packages))

(defun personal-install-packages ()
  "Install all packages listed in `personal-packages'."
  (unless (personal-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (personal-require-packages personal-packages)))

;; run package installation
(personal-install-packages)
;; refresh content
(when (not package-archive-contents)
  (package-refresh-contents))

(defmacro personal-auto-install (extension package mode)
  "When file with EXTENSION is opened triggers auto-install of PACKAGE.
PACKAGE is installed only if not already present.  The file is opened in MODE."
  `(add-to-list 'auto-mode-alist
                `(,extension . (lambda ()
                                 (unless (package-installed-p ',package)
                                   (package-install ',package))
                                 (,mode)))))

(defvar personal-auto-install-alist
  '(("\\.clj\\'" clojure-mode clojure-mode)
    ("\\.coffee\\'" coffee-mode coffee-mode)
    ("\\.css\\'" css-mode css-mode)
    ("\\.csv\\'" csv-mode csv-mode)
    ("\\.d\\'" d-mode d-mode)
    ("\\.dart\\'" dart-mode dart-mode)
    ("\\.erl\\'" erlang erlang-mode)
    ("\\.feature\\'" feature-mode feature-mode)
    ("\\.go\\'" go-mode go-mode)
    ("\\.groovy\\'" groovy-mode groovy-mode)
    ("\\.haml\\'" haml-mode haml-mode)
    ("\\.hs\\'" haskell-mode haskell-mode)
    ("\\.latex\\'" auctex LaTeX-mode)
    ("\\.less\\'" less-css-mode less-css-mode)
    ("\\.lua\\'" lua-mode lua-mode)
    ("\\.markdown\\'" markdown-mode markdown-mode)
    ("\\.md\\'" markdown-mode markdown-mode)
    ("\\.ml\\'" tuareg tuareg-mode)
    ("\\.pp\\'" puppet-mode puppet-mode)
    ("\\.php\\'" php-mode php-mode)
    ("PKGBUILD\\'" pkgbuild-mode pkgbuild-mode)
    ("\\.sass\\'" sass-mode sass-mode)
    ("\\.scala\\'" scala-mode2 scala-mode)
    ("\\.scss\\'" scss-mode scss-mode)
    ("\\.slim\\'" slim-mode slim-mode)
    ("\\.textile\\'" textile-mode textile-mode)
    ("\\.yml\\'" yaml-mode yaml-mode)))

;; markdown-mode doesn't have autoloads for the auto-mode-alist
;; so we add them manually if it's already installed
(when (package-installed-p 'markdown-mode)
  (dolist (r '("\\.markdown\\'" "\\.md\\'"))
    (add-to-list 'auto-mode-alist (cons r 'markdown-mode))))

(when (package-installed-p 'pkgbuild-mode)
  (add-to-list 'auto-mode-alist '("PKGBUILD\\'" . pkgbuild-mode)))

;; build auto-install mappings
(mapc
 (lambda (entry)
   (let ((extension (car entry))
         (package (cadr entry))
         (mode (cadr (cdr entry))))
     (unless (package-installed-p package)
       (personal-auto-install extension package mode))))
 personal-auto-install-alist)


;; +--
;; | CUSTOM FUNCTIONS
;; +-------------------+
(defun remove-trailing-whitespaces-and-tabs ()
  "Remove all trailing whitespaces and untabify buffer."
  (interactive)
  (if (not indent-tabs-mode)
      (untabify (point-min) (point-max)))
  (delete-trailing-whitespace))
(add-hook 'before-save-hook 'remove-trailing-whitespaces-and-tabs)

(defun make-directory-automaticly-on-save ()
  "Makes directory on save of file."
  (when buffer-file-name
    (let ((dir (file-name-directory buffer-file-name)))
      (when (and (not (file-exists-p dir))
                 (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
        (make-directory dir t)))))
(add-hook 'before-save-hook 'make-directory-automaticly-on-save)


(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (let ((yas-fallback-behavior nil))
            (unless (yas-expand)
              (dabbrev-expand nil)))
        (indent-for-tab-command)))))

(defun split-window-transpose (&optional arg)
  "Switch between horizontal and vertical 2-window layouts"
  (interactive "p")
  (if (eq 2 (count-windows))
      (let* ((sel-w (selected-window))
             (fw (frame-width (window-frame sel-w)))
             (ww (window-width))
             (left-top-right-bottom (window-edges sel-w))
             (sel-left (nth 0 left-top-right-bottom))
             (sel-top (nth 1 left-top-right-bottom))
             (is-left-top)
             (vis-w)
             (other-w))
        (progn
          ;; save other buffer
          (defun get-other-window ()
            (walk-windows
             (function (lambda(w)
                         (if (not (equal w (selected-window)))
                             (push w vis-w)))))
            (car vis-w))
          (setq other-b (window-buffer (get-other-window)))

          ;; clear other window
          (delete-other-windows)

          ;; determine which way to transpose
          (if (= fw ww)
              (split-window-horizontally)
            (split-window-vertically))

          ;; determine whether it's left/top or right/bottom
          (if (or (> sel-left 0) (> sel-top 0))
              ;; right bottom
              (progn
                (set-window-buffer (selected-window) other-b)
                (other-window 1))
            (progn
              (setq other-w (get-other-window))
              (set-window-buffer other-w other-b)))))))

;; stops hidding windows on escape...
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

(defun split-window-vertically-and-other-window ()
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun split-window-horizontally-and-other-window ()
  (interactive)
  (split-window-horizontally)
  (other-window 1))

(defun personal-kill-whole-line (&optional arg)
  "A simple wrapper around command `kill-whole-line' that respects indentation.
Passes ARG to command `kill-whole-line' when provided."
  (interactive "p")
  (kill-whole-line arg)
  (back-to-indentation))

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))

(defun rename-file-and-buffer ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (when (y-or-n-p (format "Are you sure you want to delete %s? " filename))
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (or (equal major-mode 'dired-mode)
              (and (buffer-file-name)
                   (not (file-exists-p (file-name-directory (buffer-file-name)))))
              (and (buffer-file-name)
                   (file-writable-p buffer-file-name)))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (if (/= (count-windows) 2)
      (message "You need exactly 2 windows to do this.")
    (let* ((w1 (car (window-list)))
           (w2 (cadr (window-list)))
           (b1 (window-buffer w1))
           (b2 (window-buffer w2))
           (s1 (window-start w1))
           (s2 (window-start w2)))
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (set-window-start w1 s2)
      (set-window-start w2 s1)))
  (other-window 1))

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; note - this should be after volatile-highlights is required
;; add the ability to copy and cut the current line, without marking it
(defadvice kill-ring-save (before smart-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position)
           (line-end-position)))))

(defadvice kill-region (before smart-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))



(defun recentf-projectile-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (projectile-completing-read "Choose recent file: "
                                   (-map 'abbreviate-file-name recentf-list)
                                   nil)))
    (when file
      (find-file file))))

;; +--
;; | BASIC SETTINGS
;; +-------------------+
(personal-require-packages '(monokai-theme))
(load-theme 'monokai t)

;; make visual bell
(setq visible-bell t)
(setq make-backup-files nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(global-subword-mode t)
(menu-bar-mode 0)
(column-number-mode t)
(delete-selection-mode t)
(global-auto-revert-mode t)

;; utf-8 encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; disable ring bell
(setq ring-bell-function 'ignore)
(modify-syntax-entry ?- "w")

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq create-lockfiles nil)

(personal-require-packages '(plantuml-mode))

(dolist (r '("\\.plu$" "\\.uml$" "\\.pla$"))
  (add-to-list 'auto-mode-alist (cons r 'plantuml-mode)))

(setq plantuml-jar-path (expand-file-name "vendor/plantuml.jar" personal-dir))
(eval-after-load "plantuml-mode"
  '(progn
     (defun plantuml-compile ()
       "Run plantuml over current file and open the result png."
       (interactive)
       (let ((file buffer-file-name))
         (shell-command (concat "java -jar '" plantuml-jar-path
                                "' '" file "' -tpng"))
         (shell-command (concat "open -a Preview " (concat (file-name-directory file)
                                                           (file-name-sans-extension
                                                            (file-name-nondirectory file))
                                                           ".png")))))
     (let ((map (make-sparse-keymap)))
       (define-key map "\C-c\C-c" 'plantuml-compile)
       (setq plantuml-mode-map map))))

;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")


;; anzu-mode enhances isearch by showing total matches and current match position
(personal-require-packages '(anzu))
(require 'anzu)
(global-anzu-mode)

;; +--
;; | FLYCHECK
;; +-------------------+
(personal-require-packages '(flycheck))

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-flycheck-mode t)

;; +--
;; | PBCOPY
;; +-------------------+
(require 'pbcopy)
(turn-on-pbcopy)

;; +--
;; | RUBY
;; +-------------------+
(personal-require-packages '(robe inf-ruby rvm))
(dolist (r '("\\.rake\\'"
             "Rakefile\\'"
             "\\.gemspec\\'"
             "\\.ru\\'"
             "Gemfile\\'"
             "Guardfile\\'"
             "Capfile\\'"
             "\\.thor\\'"
             "Thorfile\\'"
             "Vagrantfile\\'"))
  (add-to-list 'auto-mode-alist (cons r 'ruby-mode)))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(eval-after-load 'ruby-mode
  '(progn
     (defun ruby-mode-defaults ()
       (inf-ruby-minor-mode +1)
       (ruby-tools-mode +1)
       ;; CamelCase aware editing operations
       (subword-mode +1))
     (add-hook 'ruby-mode-hook 'ruby-mode-defaults)))

(require 'robe)
;; handle underscore as part of word
(add-hook 'ruby-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-k") 'inf-ruby-console-auto)
            (local-set-key (kbd "C-c C-z") 'inf-ruby-console-auto)
            (rvm-activate-corresponding-ruby)))

(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
(add-hook 'ruby-mode-hook 'robe-mode)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; +--
;; | CLOJURE
;; +-------------------+
(personal-require-packages '(clojure-mode cider))
(dolist (r '("\\.cljs$" "\\.cljx$" "\\.edn$"))
  (add-to-list 'auto-mode-alist (cons r 'clojure-mode)))

;; +--
;; | ERLANG
;; +-------------------+
(personal-require-packages '(erlang flymake flymake-cursor))

(eval-after-load "erlang"
  '(progn
     (require 'erlang-start)
     (require 'erlang-eunit)
     (require 'erlang-flymake)
     (erlang-flymake-only-on-save)))

;; take care about soft tabs
(add-hook 'erlang-mode-hook
          (lambda ()
            (setq-local flycheck-checkers '())
            (setq-default indent-tabs-mode nil)
            (setq erlang-compile-function 'inferior-erlang-compile)
            (modify-syntax-entry ?_ "w")
            (setq erlang-eunit-autosave t)
            (setq-default tab-width 4)))

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            (setq truncate-lines nil)))

(dolist (r '("rebar.config$" ".erlang$" "\\.config$" "\\.rel$"))
  (add-to-list 'auto-mode-alist (cons r 'erlang-mode)))

;; define where put beam files
(setq erlang-compile-outdir "../ebin")
;; configure node names.. for erlang mode and distel
(setq erl-nodename-cache 'emacs@127.0.0.1)
(setq distel-modeline-node "emacs@127.0.0.1")

;; configure path to wrangler
(setq wrangler-path (expand-file-name "vendor/wrangler/elisp" personal-dir))
(require 'wrangler)

(defun flatten-list (list)
  (apply #'append list))

;; search for top project directory
(defun erlang-find-rebar-top-recr (dirname)
  (let* ((project-dir (or (locate-dominating-file dirname "rebar.config")
                          (locate-dominating-file dirname "Makefile"))))
    (if project-dir
        (let* ((parent-dir
                (file-name-directory (directory-file-name project-dir)))
               (top-project-dir
                (if (and parent-dir (not (string= parent-dir "/")))
                    (erlang-find-rebar-top-recr parent-dir)
                  nil)))
          (if top-project-dir
              top-project-dir
            project-dir))
      project-dir)))

(defun erlang-find-rebar-top ()
  (interactive)
  (let* ((dirname (file-name-directory (buffer-file-name)))
         (project-dir (erlang-find-rebar-top-recr dirname)))
    (if project-dir
        project-dir
      (erlang-flymake-get-app-dir))))

(defun erlang-directory-dirs (dir name)
  "Find all directories in DIR."
  (unless (file-directory-p dir)
    (error "Not a directory `%s'" dir))
  (let ((dir (directory-file-name dir))
        (dirs '())
        (files (directory-files dir nil nil t)))
    (dolist (file files)
      (unless (member file '("." ".."))
        (let ((absolute-path (expand-file-name (concat dir "/" file))))
          (when (file-directory-p absolute-path)
            (if (string= file name)
                (setq dirs (append
                            (cons absolute-path
                                  (erlang-directory-dirs absolute-path name))
                            dirs))
              (setq dirs (append
                          (erlang-directory-dirs absolute-path name)
                          dirs)))))))
    dirs))

(defun erlang-all-dirs-with-name (name)
  (append (list (concat (erlang-find-rebar-top) name))
          (erlang-directory-dirs (erlang-find-rebar-top) name)))

(defun erlang-get-deps-code-path-dirs ()
  (erlang-all-dirs-with-name "ebin"))

(defun erlang-get-deps-include-dirs ()
  (erlang-all-dirs-with-name "include"))

(setq erlang-flymake-get-code-path-dirs-function 'erlang-get-deps-code-path-dirs)
(setq erlang-flymake-get-include-dirs-function 'erlang-get-deps-include-dirs)

(add-hook 'erlang-mode-hook
      (lambda ()
        (setq inferior-erlang-machine-options (dynamic-inferior-erlang-machine-options))
        (setq erlang-compile-extra-opts (dynamic-erlang-compile-extra-opts))))

(defun dynamic-erlang-compile-extra-opts ()
  "Generate compile optins with all 'include' dirs."
  (append
   (mapcar (lambda (dir) (cons 'i dir))
           (erlang-get-deps-include-dirs))
   '(bin_opt_info debug_info (d . \'TEST\'))))

(defun dynamic-inferior-erlang-machine-options ()
  "Generate inferiror optins with all 'ebin' and 'include' dirs."
  (append
   (list "-name" "emacs@127.0.0.1")
   (flatten-list
    (mapcar (lambda (dir) (list "-pa" dir))
            (erlang-get-deps-code-path-dirs)))
   (flatten-list
    (mapcar (lambda (dir) (list "-i" dir))
            (erlang-get-deps-include-dirs)))))

;; +--
;; | DIRED
;; +-------------------+
(personal-require-packages '(dired-details))
;; enable dired-details extension
(require 'dired-details)
(dired-details-install)

;; dired - reuse current buffer by pressing 'a'
(put 'dired-find-alternate-file 'disabled nil)

;; if there is a dired buffer displayed in the next window, use its
;; current subdir, instead of the current subdir of this dired buffer
(setq dired-dwim-target t)

;; always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; disable dired hidden string
(setq-default dired-details-hidden-string "")

;; define hidden extensions
(setq-default dired-omit-extensions
              '(".pyc" ".beam" ".class" ".o" "~" ".dvi" ".aux" ".elc" ".iml"))

;; enable omit mode always
(defun turn-on-omit-mode ()
  "Hide files with defined extensions in dired mode"
  (require 'dired-x)
  (dired-omit-mode 1))
(add-hook 'dired-mode-hook 'turn-on-omit-mode)

;; use gnu ls
;; $ brew install coreutils
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program t)
(setq insert-directory-program "/usr/local/bin/gls")
;; sort - directories on top
(setq dired-listing-switches "-aBhl  --group-directories-first")

(require 'dired)
(require 'dash)
;; move files between split panes
(setq dired-dwim-target t)

;; reload dired after making changes
(--each '(dired-do-rename
          dired-do-copy
          dired-create-directory
          wdired-abort-changes)
  (eval `(defadvice ,it (after revert-buffer activate)
           (revert-buffer))))

;; +--
;; | RAINBOW DELIMITERS
;; +-------------------+
(personal-require-packages '(rainbow-delimiters))
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; +--
;; | YASNIPPET
;; +-------------------+
(personal-require-packages '(yasnippet))
(require 'yasnippet)
(yas-load-directory (expand-file-name "snippets" personal-dir))
(yas-global-mode 1)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))

;; +--
;; | UNIQUIFY
;; +-------------------+
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; +--
;; | SAVEPLACE
;; +-------------------+
(require 'saveplace)
(setq save-place-file (expand-file-name "saveplace" personal-savefile-dir))
;; activate it for all buffers
(setq-default save-place t)

;; +--
;; | SAVEHIST
;; +-------------------+
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" personal-savefile-dir))
(savehist-mode +1)

;; +--
;; | RECENTF
;; +-------------------+
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" personal-savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15)
(recentf-mode +1)

;; +--
;; | ZOOM WINDOW
;; +-------------------+
(require 'zoom-window)
(setq zoom-window-mode-line-color "#403D3D")

;; +--
;; | ACE JUMP
;; +-------------------+
(personal-require-packages '(ace-jump-buffer ace-jump-mode))
(require 'ace-jump-mode)
(require 'ace-jump-buffer)

;; +--
;; | MULTIPLE CURSORS
;; +-------------------+
(personal-require-packages '(multiple-cursors))
(require 'multiple-cursors)

;; +--
;; | IDO
;; +-------------------+
(personal-require-packages '(ido-ubiquitous flx-ido))
(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" personal-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
(ido-ubiquitous-mode +1)

;;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

(require 'expand-region)

;; +--
;; | SMEX
;; +-------------------+
(personal-require-packages '(smex))
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" personal-savefile-dir))
(smex-initialize)

;; +--
;; | PROJECTILE
;; +-------------------+
(setq projectile-completion-system 'grizzl)
(personal-require-packages '(projectile grizzl))
(projectile-global-mode)

(custom-set-faces
 '(flymake-errline ((t (:foreground "#5f0000" :background "#EE6AA7" :weight bold :underline nil))))
 '(flymake-warnline ((t (:foreground "#968b26" :background "#fff68f" :weight bold :underline nil))))
 )
