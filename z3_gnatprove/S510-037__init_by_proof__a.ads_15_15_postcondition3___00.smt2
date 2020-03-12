(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun global_a_init (Bool Int) Bool)

(declare-fun global_a_init__function_guard (Bool Bool Int) Bool)

(declare-sort my_natural 0)

(declare-fun my_naturalqtint (my_natural) Int)

;; my_natural'axiom
  (assert
  (forall ((i my_natural))
  (and (<= 0 (my_naturalqtint i)) (<= (my_naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (my_natural my_natural) Bool)

(declare-const dummy1 my_natural)

(declare-datatypes ()
((my_natural__ref (my_natural__refqtmk (my_natural__content my_natural)))))
(define-fun my_natural__ref_my_natural__content__projection ((a my_natural__ref)) my_natural 
  (my_natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_159)))

;; global_a_init__post_axiom
  (assert true)

;; global_a_init__def_axiom
  (assert
  (forall ((a__global_a__attr__init Bool))
  (forall ((a__global_a Int))
  (! (= (= (global_a_init a__global_a__attr__init a__global_a) true)
     (= (let ((temp___163 a__global_a))
        (ite (= a__global_a__attr__init true) true false)) true)) :pattern (
  (global_a_init a__global_a__attr__init a__global_a)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const status Int)

(declare-const global_a Int)

(declare-const global_a__attr__init Bool)

;; Assume
  (assert (dynamic_invariant status false false true true))

;; Assume
  (assert (dynamic_invariant1 global_a global_a__attr__init false true true))

(declare-const status1 Int)

(declare-const global_a1 Int)

(declare-const global_a__attr__init1 Bool)

;; H
  (assert
  (or
  (exists ((aa__initglobalsaa__status Int))
  (and (dynamic_invariant aa__initglobalsaa__status true true true true)
  (and (= status1 aa__initglobalsaa__status)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= status1 0) false true))
  (and (not (= spark__branch true))
  (exists ((global_a__attr__init2 Bool))
  (and (= global_a__attr__init2 true)
  (exists ((global_a2 Int))
  (and (= global_a2 1)
  (and (= global_a__attr__init2 true)
  (exists ((aa__useaa__x Int))
  (and (dynamic_invariant aa__useaa__x true true true true)
  (and (= global_a__attr__init2 true)
  (and (= global_a__attr__init1 true) (= global_a1 aa__useaa__x))))))))))))))))
  (and
  (and
  (exists ((aa__initglobalsaa__status Int))
  (and (dynamic_invariant aa__initglobalsaa__status true true true true)
  (and (= status1 aa__initglobalsaa__status)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= status1 0) false true))
  (= spark__branch true)))))) (= global_a1 global_a))
  (= global_a__attr__init1 global_a__attr__init))))

;; H
  (assert (= status1 0))

;; H
  (assert
  (forall ((global_a2 Int) (global_a__attr__init2 Bool))
  (global_a_init__function_guard
  (global_a_init global_a__attr__init2 global_a2) global_a__attr__init2
  global_a2)))

(assert
;; defqtvc
 ;; File "a.ads", line 13, characters 0-0
  (not (= (global_a_init global_a__attr__init1 global_a1) true)))
(check-sat)
