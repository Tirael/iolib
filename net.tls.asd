;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Indent-tabs-mode: NIL -*-
;;;
;;; net.tls.asd --- ASDF system definition.
;;;
;;; Copyright (C) 2008, Stelian Ionescu  <sionescu@common-lisp.net>
;;;
;;; This code is free software; you can redistribute it and/or
;;; modify it under the terms of the version 2.1 of
;;; the GNU Lesser General Public License as published by
;;; the Free Software Foundation, as clarified by the
;;; preamble found here:
;;;     http://opensource.franz.com/preamble.html
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General
;;; Public License along with this library; if not, write to the
;;; Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
;;; Boston, MA 02110-1301, USA

(in-package :common-lisp-user)

(eval-when (:load-toplevel)
  (asdf:oos 'asdf:load-op :cffi-grovel))

(asdf:defsystem :net.tls
  :description "TLS 1.0/SSL 3.0 library."
  :author "Stelian Ionescu <sionescu@common-lisp.net>"
  :licence "LLGPL-2.1"
  :depends-on (:cffi :osicat :gpg-error :alexandria)
  :pathname (merge-pathnames #p"net.tls/" *load-truename*)
  :components
  ((:file "pkgdcl")
   (cffi-grovel:grovel-file "grovel" :depends-on ("pkgdcl"))
   (:file "library" :depends-on ("pkgdcl"))
   (cffi-grovel:wrapper-file "wrappers" :depends-on ("pkgdcl" "library"))
   (:file "gnutls" :depends-on ("pkgdcl" "grovel" "library"))
   (:file "conditions" :depends-on ("pkgdcl" "grovel" "gnutls"))))
