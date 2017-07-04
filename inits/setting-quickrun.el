;; Add C++ command for C++17 and set it default in C++ file.
(quickrun-add-command "c++17"
                      '((:command . "g++")
                        (:exec . ("%c -std=c++17 -lstdc++ %o -o %e %s"
                                  "%e %a"))
                        (:remove . ("%e")))
                      :default "c++")

(quickrun-set-default "c++" "c++17")

(quickrun-add-command "nodejs"
                      '((:command . "nodejs")
                        (:exec . ("%c %s")))
                      :default "nodejs")


(quickrun-set-default "javascript" "nodejs")
