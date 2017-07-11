(setenv "PATH"
        (concat
         "/opt/local/bin" ":"
         "/opt/local/sbin" ":"
         (getenv "PATH")))
      
(setq exec-path (append exec-path '("/opt/local/bin")))
(setq exec-path (append exec-path '("/opt/local/sbin")))
