;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Indent-tabs-mode: NIL -*-
;;;
;;; library.lisp --- Load GNUTLS.
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

(in-package :net.tls)

(define-foreign-library :gcrypt
  (:darwin "libgcrypt.dylib")
  (:unix "libgcrypt.so"))

(define-foreign-library :gnutls
  (:darwin "libgnutls.dylib")
  (:unix "libgnutls.so"))

(define-foreign-library :gnutls-extra
  (:darwin "libgnutls-extra.dylib")
  (:unix "libgnutls-extra.so"))

(use-foreign-library :gcrypt)
(use-foreign-library :gnutls)
(use-foreign-library :gnutls-extra)
