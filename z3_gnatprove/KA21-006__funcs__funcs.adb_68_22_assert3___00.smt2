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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun f1 (Int) Bool)

(declare-fun f1__function_guard (Bool Int) Bool)

;; f1__post_axiom
  (assert true)

;; f1__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (f1 x) true) (< 0 x)) :pattern ((f1 x)) )))

(declare-fun f2 (Int) Bool)

(declare-fun f2__function_guard (Bool Int) Bool)

;; f2__post_axiom
  (assert true)

;; f2__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (f2 x) true) (< 0 x)) :pattern ((f2 x)) )))

(declare-fun f5 (Int) Bool)

(declare-fun f5__function_guard (Bool Int) Bool)

;; f5__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun g1 (Int Int) Bool)

(declare-fun g1__function_guard (Bool Int Int) Bool)

;; g1__post_axiom
  (assert true)

;; g1__def_axiom
  (assert
  (forall ((x Int) (funcs__g Int))
  (! (= (= (g1 x funcs__g) true) (< 0 funcs__g)) :pattern ((g1 x funcs__g)) )))

(declare-fun g2 (Int Int) Bool)

(declare-fun g2__function_guard (Bool Int Int) Bool)

;; g2__post_axiom
  (assert true)

;; g2__def_axiom
  (assert
  (forall ((x Int) (funcs__g Int))
  (! (= (= (g2 x funcs__g) true) (< 0 funcs__g)) :pattern ((g2 x funcs__g)) )))

(declare-fun g5 (Int Int) Bool)

(declare-fun g5__function_guard (Bool Int Int) Bool)

;; g5__post_axiom
  (assert true)

(declare-fun p2 (Int) Bool)

(declare-fun p2__function_guard (Bool Int) Bool)

;; p2__post_axiom
  (assert true)

;; p2__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (p2 x) true) (< 0 x)) :pattern ((p2 x)) )))

(declare-fun p5 (Int) Bool)

(declare-fun p5__function_guard (Bool Int) Bool)

;; p5__post_axiom
  (assert true)

(declare-fun q2 (Int) Bool)

(declare-fun q2__function_guard (Bool Int) Bool)

;; q2__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (q2 x)))
     (=> (q2__function_guard result x) (= (= result true) (< 0 x))))) :pattern (
  (q2 x)) )))

;; q2__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (q2 x) true) (< 0 x)) :pattern ((q2 x)) )))

(declare-fun q5 (Int) Bool)

(declare-fun q5__function_guard (Bool Int) Bool)

;; q5__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (q5 x)))
     (=> (q5__function_guard result x) (= (= result true) (< 0 x))))) :pattern (
  (q5 x)) )))

(declare-fun f3 (Int) Bool)

(declare-fun f3__function_guard (Bool Int) Bool)

;; f3__post_axiom
  (assert true)

;; f3__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (f3 x) true) (< 0 x)) :pattern ((f3 x)) )))

(declare-fun f4 (Int) Bool)

(declare-fun f4__function_guard (Bool Int) Bool)

;; f4__post_axiom
  (assert true)

;; f4__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (f4 x) true) (< 0 x)) :pattern ((f4 x)) )))

(declare-fun g3 (Int Int) Bool)

(declare-fun g3__function_guard (Bool Int Int) Bool)

;; g3__post_axiom
  (assert true)

;; g3__def_axiom
  (assert
  (forall ((x Int) (funcs__g Int))
  (! (= (= (g3 x funcs__g) true) (< 0 funcs__g)) :pattern ((g3 x funcs__g)) )))

(declare-fun g4 (Int Int) Bool)

(declare-fun g4__function_guard (Bool Int Int) Bool)

;; g4__post_axiom
  (assert true)

;; g4__def_axiom
  (assert
  (forall ((x Int) (funcs__g Int))
  (! (= (= (g4 x funcs__g) true) (< 0 funcs__g)) :pattern ((g4 x funcs__g)) )))

(declare-fun p4 (Int) Bool)

(declare-fun p4__function_guard (Bool Int) Bool)

;; p4__post_axiom
  (assert true)

;; p4__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (p4 x) true) (< 0 x)) :pattern ((p4 x)) )))

(declare-fun q4 (Int) Bool)

(declare-fun q4__function_guard (Bool Int) Bool)

;; q4__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (q4 x)))
     (=> (q4__function_guard result x) (= (= result true) (< 0 x))))) :pattern (
  (q4 x)) )))

;; q4__def_axiom
  (assert
  (forall ((x Int)) (! (= (= (q4 x) true) (< 0 x)) :pattern ((q4 x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const g Int)

;; Assume
  (assert (dynamic_invariant g true false true true))

;; H
  (assert (f1__function_guard (f1 3) 3))

;; Assert
  (assert (= (f1 3) true))

(define-fun o () Bool (f1 3))

;; H
  (assert (f1__function_guard o 3))

;; H
  (assert (= (= o true) (< 0 3)))

(declare-const y Bool)

;; H
  (assert (= y o))

;; H
  (assert (f1__function_guard (f1 3) 3))

;; Assert
  (assert (= (= y true) (= (f1 3) true)))

;; H
  (assert (f2__function_guard (f2 3) 3))

;; Assert
  (assert (= (f2 3) true))

(define-fun o1 () Bool (f2 3))

;; H
  (assert (f2__function_guard o1 3))

;; H
  (assert (= (= o1 true) (< 0 3)))

(declare-const y1 Bool)

;; H
  (assert (= y1 o1))

;; H
  (assert (f2__function_guard (f2 3) 3))

;; Assert
  (assert (= (= y1 true) (= (f2 3) true)))

;; H
  (assert (f3__function_guard (f3 3) 3))

(assert
;; defqtvc
 ;; File "funcs.adb", line 61, characters 0-0
  (not (= (f3 3) true)))
(check-sat)
