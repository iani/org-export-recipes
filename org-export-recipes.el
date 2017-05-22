;;; org-export-recipes --- insert file selected from this folder

;;; Commentary:

;; define concenience function for selecting a recipe file
;; from this folder and insering it in the org file to configure export.

;;; Code:

(require 'helm)

(defconst org-export-recipe-folder (concat
                                    (file-name-directory load-file-name)
                                    "/recipes/"))

(defconst org-export-snippet-folder (concat
                                    (file-name-directory load-file-name)
                                    "/snippets/"))

(defun org-export-insert-recipe (snippet-p)
  "Select and insert file from this folder to org-mode file.
If SNIPPET-P then insert snippet from snippet folder in text at point.
Else insert recipe from recipe folder at top of file."
  (interactive "P")
  (if snippet-p
      (insert-file-contents
       (helm-read-file-name "select snippet:" :initial-input org-export-snippet-folder)))
  (save-excursion
    (goto-char 0)
    (insert-file-contents  (helm-read-file-name "select recipe:" :initial-input org-export-recipe-folder))))

(global-set-key (kbd "H-c i") 'org-export-insert-recipe)

(provide 'org-export-recipes)
;;; org-export-recipes.el ends here


