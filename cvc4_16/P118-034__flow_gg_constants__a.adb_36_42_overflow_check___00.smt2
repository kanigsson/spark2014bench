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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun add (Int Int) Int)

(declare-fun add__function_guard (Int Int Int) Bool)

(declare-fun add_annotated (Int Int) Int)

(declare-fun add_annotated__function_guard (Int Int Int) Bool)

(declare-fun add_annotated_local (Int Int) Int)

(declare-fun add_annotated_local__function_guard (Int Int Int) Bool)

(declare-const c3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const c6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const c8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

;; add_annotated_local__post_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true))
     (let ((result (add_annotated_local x y)))
     (=> (add_annotated_local__function_guard result x y) (dynamic_invariant
     result true false true true)))) :pattern ((add_annotated_local x y)) )))

;; add_annotated_local__def_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true)) (= (add_annotated_local x y) (+ x y))) :pattern (
  (add_annotated_local x y)) )))

;; c3__def_axiom
  (assert
  (and (add_annotated_local__function_guard (add_annotated_local 42 44) 42
  44) (= c3 (add_annotated_local 42 44))))

;; c4__def_axiom
  (assert
  (and (add_annotated_local__function_guard (add_annotated_local 42 c3) 42
  c3) (= c4 (add_annotated_local 42 c3))))

;; c5__def_axiom
  (assert
  (and (add_annotated__function_guard (add_annotated c3 c4) c3 c4)
  (= c5 (add_annotated c3 c4))))

;; c6__def_axiom
  (assert
  (and (add_annotated__function_guard (add_annotated c3 c5) c3 c5)
  (= c6 (add_annotated c3 c5))))

;; c7__def_axiom
  (assert (and (add__function_guard (add c5 c6) c5 c6) (= c7 (add c5 c6))))

;; c8__def_axiom
  (assert (and (add__function_guard (add c5 c7) c5 c7) (= c8 (add c5 c7))))

;; add__post_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true))
     (let ((result (add x y)))
     (=> (add__function_guard result x y) (dynamic_invariant result true
     false true true)))) :pattern ((add x y)) )))

;; add__def_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true)) (= (add x y) (+ x y))) :pattern ((add x y)) )))

;; add_annotated__post_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true))
     (let ((result (add_annotated x y)))
     (=> (add_annotated__function_guard result x y) (dynamic_invariant result
     true false true true)))) :pattern ((add_annotated x y)) )))

;; add_annotated__def_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true)) (= (add_annotated x y) (+ x y))) :pattern ((add_annotated
                                                                 x y)) )))

(assert
;; defqtvc
 ;; File "a.adb", line 28, characters 0-0
  (not
  (=> (dynamic_invariant c3 true false true true)
  (=> (= (add_annotated_local 42 44) c3)
  (=> (dynamic_invariant c4 true false true true)
  (=> (= (add_annotated_local 42 c3) c4)
  (=> (dynamic_invariant c5 true false true true)
  (=> (= (add_annotated c3 c4) c5)
  (=> (dynamic_invariant c6 true false true true)
  (=> (= (add_annotated c3 c5) c6)
  (=> (dynamic_invariant c7 true false true true)
  (=> (= (add c5 c6) c7)
  (=> (dynamic_invariant c8 true false true true)
  (=> (= (add c5 c7) c8)
  (let ((o (+ 86 c3)))
  (=> (in_range1 o)
  (let ((o1 (+ o c4)))
  (=> (in_range1 o1)
  (let ((o2 (+ o1 c5)))
  (=> (in_range1 o2)
  (let ((o3 (+ o2 c6))) (=> (in_range1 o3) (in_range1 (+ o3 c7))))))))))))))))))))))))
(check-sat)
(exit)
