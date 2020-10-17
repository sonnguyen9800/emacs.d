(require 'csharp-mode)
(add-to-list 'auto-mode-alist '("\\.cs?\\'" . company-mode))
(add-to-list 'auto-mode-alist '("\\.cs?\\'" . csharp-mode))

;; For Unity Developer
(setq lsp-enable-file-watchers 

"/[Ll]ibrary/"
"/[Tt]emp/"
"/[Oo]bj/"
"/[Bb]uild/"
"/[Bb]uilds/"
"/[Ll]ogs/"
"/[Uu]ser[Ss]ettings/"
"/[Mm]emoryCaptures/"
"!/[Aa]ssets/**/*.meta"
".gradle/"
"ExportedObj/"
".consulo/"
"*.csproj"
"*.unityproj"
"*.sln"
"*.suo"
"*.tmp"
"*.user"
"*.userprefs"
"*.pidb"
"*.booproj"
"*.svd"
"*.pdb"
"*.mdb"
"*.opendb"
"*.VC.db"
"*.pidb.meta"
"*.pdb.meta"
"*.mdb.meta"
"sysinfo.txt"
"*.apk"
"*.aab"
"*.unitypackage"
"crashlytics-build.properties"
"/[Aa]ssets/[Aa]ddressable[Aa]ssets[Dd]ata/*/*.bin*"
"/[Aa]ssets/[Ss]treamingAssets/aa.meta"
"/[Aa]ssets/[Ss]treamingAssets/aa/*"
)
(provide 'csharp-bundle)
