;;; org-export-recipes --- insert file selected from this folder

;;; Commentary:

;; define concenience function for selecting a recipe file
;; from this folder and insering it in the org file to configure export.

;;; Code:

(require 'helm)

(defconst org-export-recipe-folder (concat
                                    (file-name-directory load-file-name)
                                    "/recipes/"))

(defun org-export-insert-recipe ()
  "Select and insert file from this folder to org-moe file."
  (interactive)
  (let ((recipe
         (helm-read-file-name "select-recipe:" :initial-input org-export-recipe-folder)))
    (save-excursion
      (goto-char 0)
     (insert-file-contents recipe))))

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "H-c i") 'org-export-insert-recipe)
             ))


(provide 'org-export-recipes)
;;; org-export-recipes.el ends here


