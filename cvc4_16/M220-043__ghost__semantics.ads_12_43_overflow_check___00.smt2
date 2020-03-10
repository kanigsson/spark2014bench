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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-fun ghost_func (tuple0) Int)

(declare-fun ghost_func__function_guard (Int tuple0) Bool)

;; ghost_func__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (ghost_func us_void_param)))
     (=> (ghost_func__function_guard result us_void_param) (dynamic_invariant
     result true false true true))) :pattern ((ghost_func us_void_param)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort t1b 0)

(declare-fun t1bqtint (t1b) Int)

;; t1b'axiom
  (assert (forall ((i t1b)) (and (<= 1 (t1bqtint i)) (<= (t1bqtint i) 2))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (t1b t1b) Bool)

(declare-const dummy1 t1b)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content t1b)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) t1b (t1b__content
                                                                 a))

(assert
;; defqtvc
 ;; File "semantics.ads", line 10, characters 0-0
  (not
  (forall ((formal Int))
  (=> (dynamic_invariant formal true false true true)
  (=> (ghost_func__function_guard (ghost_func Tuple0) Tuple0)
  (=> (= formal (ghost_func Tuple0))
  (=> (ghost_func__function_guard (ghost_func Tuple0) Tuple0)
  (=> (< 0 (+ formal (ghost_func Tuple0)))
  (=> (ghost_func__function_guard (ghost_func Tuple0) Tuple0)
  (=> (< 0 (+ formal (ghost_func Tuple0)))
  (forall ((formal1 Int))
  (=> (ghost_func__function_guard (ghost_func Tuple0) Tuple0)
  (=> (ghost_func__function_guard (ghost_func Tuple0) Tuple0)
  (=>
  (exists ((i Int))
  (and (= i 1)
  (ite (= (and (ite (<= 1 i) true false) (ite (<= i 2) true false)) true)
  (let ((o (+ formal 1)))
  (and (in_range1 o)
  (exists ((formal2 Int))
  (and (= formal2 o)
  (let ((o1 (ghost_func Tuple0)))
  (and
  (and (ghost_func__function_guard o1 Tuple0) (dynamic_invariant o1 true
  false true true))
  (and (in_range1 (+ formal2 o1))
  (exists ((i1 Int))
  (and (< 0 (+ formal1 (ghost_func Tuple0)))
  (and
  (= (and (ite (and (dynamic_invariant formal1 true true true true)
               (in_range2 i1))
          true false) (ite (and (<= 1 i1) (<= i1 2)) true false)) true)
  (exists ((temp___172 Int))
  (and (= temp___172 (+ formal1 (ghost_func Tuple0))) (= i1 2)))))))))))))
  (= formal1 formal))))
  (let ((o (ghost_func Tuple0)))
  (=>
  (and (ghost_func__function_guard o Tuple0) (dynamic_invariant o true false
  true true)) (in_range1 (+ o 1))))))))))))))))))
(check-sat)
(exit)
