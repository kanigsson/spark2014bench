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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun incr_pub (Int) Int)

(declare-fun incr_pub__function_guard (Int Int) Bool)

;; incr_pub__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_pub x)))
     (=> (incr_pub__function_guard result x) (dynamic_invariant result true
     false true true)))) :pattern ((incr_pub x)) )))

;; incr_pub__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (incr_pub x) (+ x 1))) :pattern (
  (incr_pub x)) )))

(declare-fun incr_pub_pub (Int) Int)

(declare-fun incr_pub_pub__function_guard (Int Int) Bool)

;; incr_pub_pub__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_pub_pub x)))
     (=> (incr_pub_pub__function_guard result x) (dynamic_invariant result
     true false true true)))) :pattern ((incr_pub_pub x)) )))

;; incr_pub_pub__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (incr_pub_pub x) (+ x 1))) :pattern ((incr_pub_pub x)) )))

(declare-fun incr_pub_priv (Int) Int)

(declare-fun incr_pub_priv__function_guard (Int Int) Bool)

;; incr_pub_priv__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_pub_priv x)))
     (=> (incr_pub_priv__function_guard result x) (dynamic_invariant result
     true false true true)))) :pattern ((incr_pub_priv x)) )))

;; incr_pub_priv__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (incr_pub_priv x) (+ x 1))) :pattern ((incr_pub_priv x)) )))

(declare-fun incr_pub_body (Int) Int)

(declare-fun incr_pub_body__function_guard (Int Int) Bool)

;; incr_pub_body__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_pub_body x)))
     (=> (incr_pub_body__function_guard result x) (dynamic_invariant result
     true false true true)))) :pattern ((incr_pub_body x)) )))

;; incr_pub_body__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (incr_pub_body x) (+ x 1))) :pattern ((incr_pub_body x)) )))

(declare-fun incr_priv (Int) Int)

(declare-fun incr_priv__function_guard (Int Int) Bool)

;; incr_priv__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_priv x)))
     (=> (incr_priv__function_guard result x) (dynamic_invariant result true
     false true true)))) :pattern ((incr_priv x)) )))

;; incr_priv__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (incr_priv x) (+ x 1))) :pattern (
  (incr_priv x)) )))

(declare-fun incr_priv_priv (Int) Int)

(declare-fun incr_priv_priv__function_guard (Int Int) Bool)

;; incr_priv_priv__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_priv_priv x)))
     (=> (incr_priv_priv__function_guard result x) (dynamic_invariant result
     true false true true)))) :pattern ((incr_priv_priv x)) )))

;; incr_priv_priv__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (incr_priv_priv x) (+ x 1))) :pattern ((incr_priv_priv x)) )))

(declare-fun incr_priv_body (Int) Int)

(declare-fun incr_priv_body__function_guard (Int Int) Bool)

;; incr_priv_body__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_priv_body x)))
     (=> (incr_priv_body__function_guard result x) (dynamic_invariant result
     true false true true)))) :pattern ((incr_priv_body x)) )))

;; incr_priv_body__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (incr_priv_body x) (+ x 1))) :pattern ((incr_priv_body x)) )))

(declare-fun incr_body (Int) Int)

(declare-fun incr_body__function_guard (Int Int) Bool)

;; incr_body__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_body x)))
     (=> (incr_body__function_guard result x) (dynamic_invariant result true
     false true true)))) :pattern ((incr_body x)) )))

;; incr_body__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (incr_body x) (+ x 1))) :pattern (
  (incr_body x)) )))

(declare-fun incr_body_body (Int) Int)

(declare-fun incr_body_body__function_guard (Int Int) Bool)

;; incr_body_body__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (incr_body_body x)))
     (=> (incr_body_body__function_guard result x) (dynamic_invariant result
     true false true true)))) :pattern ((incr_body_body x)) )))

;; incr_body_body__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (incr_body_body x) (+ x 1))) :pattern ((incr_body_body x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(assert
;; defqtvc
 ;; File "incr_expr_fun.ads", line 13, characters 0-0
  (not
  (forall ((x Int))
  (=> (= x 10)
  (=> (dynamic_invariant x true false true true)
  (=> (forall ((x1 Int)) (incr_pub__function_guard (incr_pub x1) x1))
  (=> (= (incr_pub x) (+ x 1))
  (=> (forall ((x1 Int)) (incr_pub_pub__function_guard (incr_pub_pub x1) x1))
  (=> (= (incr_pub_pub x) (+ x 1)) (in_range (+ x 1)))))))))))
(check-sat)
(exit)
