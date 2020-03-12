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

(declare-fun pub (Int) Int)

(declare-fun pub__function_guard (Int Int) Bool)

(define-fun type_invariant ((temp___158 Int)) Bool (not (= temp___158 0)))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t)) (and (<= 0 (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t t) Bool)

(declare-const dummy1 t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_164)))

;; pub__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (and (dynamic_invariant1 x true true true true) (type_invariant x))
     (let ((result (pub x)))
     (=> (pub__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((pub x)) )))

(declare-fun e_pub (Int) Int)

(declare-fun e_pub__function_guard (Int Int) Bool)

;; e_pub__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (and (dynamic_invariant1 x true true true true) (type_invariant x))
     (let ((result (e_pub x)))
     (=> (e_pub__function_guard result x) (dynamic_invariant result true
     false true true)))) :pattern ((e_pub x)) )))

;; e_pub__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true) (= (e_pub x) 1)) :pattern (
  (e_pub x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun priv (Int) Int)

(declare-fun priv__function_guard (Int Int) Bool)

;; priv__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (priv x)))
     (=> (priv__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((priv x)) )))

(declare-fun e_priv (Int) Int)

(declare-fun e_priv__function_guard (Int Int) Bool)

;; e_priv__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (e_priv x)))
     (=> (e_priv__function_guard result x) (dynamic_invariant result true
     false true true)))) :pattern ((e_priv x)) )))

;; e_priv__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true) (= (e_priv x) 1)) :pattern (
  (e_priv x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x Int)

(declare-const tmp Int)

;; Assume
  (assert (dynamic_invariant1 x true false true true))

;; Assume
  (assert (type_invariant x))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant tmp false false true true))

(define-fun o () Int (- x 1))

;; Ensures
  (assert (in_range1 o))

(declare-const x1 Int)

;; H
  (assert (= x1 o))

;; Ensures
  (assert (type_invariant x1))

(define-fun o1 () Int (pub x1))

;; H
  (assert (pub__function_guard o1 x1))

;; H
  (assert (dynamic_invariant o1 true false true true))

(define-fun o2 () Int (priv x1))

;; H
  (assert (priv__function_guard o2 x1))

;; H
  (assert (dynamic_invariant o2 true false true true))

(declare-const x2 Int)

;; Ensures
  (assert (dynamic_invariant1 x2 true true true true))

;; Ensures
  (assert (type_invariant x2))

(define-fun o3 () Int (e_pub x2))

;; H
  (assert (e_pub__function_guard o3 x2))

;; H
  (assert (dynamic_invariant o3 true false true true))

;; H
  (assert (= o3 1))

(define-fun o4 () Int (e_priv x2))

;; H
  (assert (e_priv__function_guard o4 x2))

;; H
  (assert (dynamic_invariant o4 true false true true))

;; H
  (assert (= o4 1))

(assert
;; defqtvc
 ;; File "type_invariant_legal_2.ads", line 17, characters 0-0
  (not (type_invariant x2)))
(check-sat)
