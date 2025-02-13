
(cl:in-package :asdf)

(defsystem "perception_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "PercCmd" :depends-on ("_package_PercCmd"))
    (:file "_package_PercCmd" :depends-on ("_package"))
    (:file "PercReq" :depends-on ("_package_PercReq"))
    (:file "_package_PercReq" :depends-on ("_package"))
    (:file "PercState" :depends-on ("_package_PercState"))
    (:file "_package_PercState" :depends-on ("_package"))
  ))