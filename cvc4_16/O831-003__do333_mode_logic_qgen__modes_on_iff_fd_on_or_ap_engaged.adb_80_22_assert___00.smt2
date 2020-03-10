(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const offside_fd_on Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const is_ap_engaged Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const fd_on Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const modes_on Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(assert
;; defqtvc
 ;; File "modes_on_iff_fd_on_or_ap_engaged.ads", line 17, characters 0-0
  (not
  (forall ((unit_delay_out1 Bool) (fd_on_out1 Bool) (is_ap_engaged_out1 Bool)
  (modes_on_out1 Bool) (offside_fd_on_out1 Bool) (or1_out1 Bool)
  (equals_out1 Bool) (or_out1 Bool))
  (=> (= fd_on_out1 fd_on)
  (=> (= is_ap_engaged_out1 is_ap_engaged)
  (=> (= modes_on_out1 modes_on)
  (=> (= offside_fd_on_out1 offside_fd_on)
  (=>
  (= or1_out1 (ite (= (ite (= offside_fd_on_out1 true) true
                      is_ap_engaged_out1) true)
              true fd_on_out1))
  (=>
  (= equals_out1 (ite (= (ite or1_out1 1 0) (ite modes_on_out1 1 0)) true
                 false))
  (=> (= or_out1 (ite (= unit_delay_out1 true) true equals_out1))
  (= or_out1 true)))))))))))
(check-sat)
(exit)
