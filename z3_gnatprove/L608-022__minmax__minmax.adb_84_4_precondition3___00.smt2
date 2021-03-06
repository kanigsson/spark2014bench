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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert (forall ((i t)) (and (<= 1 (tqtint i)) (<= (tqtint i) 127))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t t) Bool)

(declare-const dummy1 t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 1 127)) (in_range1 temp___expr_186)))

(declare-sort e 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (e e) Bool)

(declare-const dummy2 e)

(declare-datatypes () ((e__ref (e__refqtmk (e__content e)))))
(define-fun e__ref_e__content__projection ((a e__ref)) e (e__content a))

(define-fun dynamic_invariant2 ((temp___expr_193 Int)
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (=>
                                     (or (= temp___is_init_189 true)
                                     (<= 0 3)) (in_range2 temp___expr_193)))

(declare-sort s 0)

(declare-fun sqtint (s) Int)

;; s'axiom
  (assert (forall ((i s)) (and (<= 1 (sqtint i)) (<= (sqtint i) 127))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (s s) Bool)

(declare-const dummy3 s)

(declare-datatypes () ((s__ref (s__refqtmk (s__content s)))))
(define-fun s__ref_s__content__projection ((a s__ref)) s (s__content a))

(define-fun dynamic_invariant3 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 1 127)) (in_range3 temp___expr_179)))

(declare-const min Int)

(declare-const max Int)

(declare-const mint Int)

(declare-const maxt Int)

(declare-const mine Int)

(declare-const maxe Int)

(declare-const x Int)

;; H
  (assert (= x 1))

;; Assume
  (assert (dynamic_invariant x true false true true))

(declare-const y Int)

;; H
  (assert (= y 127))

;; Assume
  (assert (dynamic_invariant y true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant min false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant max false false true true))

(declare-const v Int)

;; H
  (assert (= v 1))

;; Assume
  (assert (dynamic_invariant1 v true false true true))

(declare-const w Int)

;; H
  (assert (= w 127))

;; Assume
  (assert (dynamic_invariant1 w true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 mint false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 maxt false false true true))

(declare-const aa Int)

;; H
  (assert (= aa 0))

;; Assume
  (assert (dynamic_invariant2 aa true false true true))

(declare-const cc Int)

;; H
  (assert (= cc 2))

;; Assume
  (assert (dynamic_invariant2 cc true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 mine false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 maxe false false true true))

(declare-const min1 Int)

(declare-const max1 Int)

;; H
  (assert (dynamic_invariant min1 true true true true))

;; H
  (assert (dynamic_invariant max1 true true true true))

;; Ensures
  (assert (in_range3 y))

;; Ensures
  (assert (in_range3 x))

(assert
;; defqtvc
 ;; File "minmax.adb", line 1, characters 0-0
  (not (< x y)))
(check-sat)

(exit)
