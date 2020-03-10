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

(declare-fun oabs (Int) Int)

(declare-fun oabs__function_guard (Int Int) Bool)

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

(declare-sort y 0)

(declare-fun yqtint (y) Int)

;; y'axiom
  (assert
  (forall ((i y)) (and (<= 0 (yqtint i)) (<= (yqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (y y) Bool)

(declare-const dummy1 y)

(declare-datatypes ((y__ref 0))
(((y__refqtmk (y__content y)))))
(define-fun y__ref_y__content__projection ((a y__ref)) y (y__content a))

(define-fun dynamic_invariant1 ((temp___expr_197 Int)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (or (= temp___is_init_193 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_197)))

;; oabs__post_axiom
  (assert
  (forall ((left Int))
  (! (=> (dynamic_invariant1 left true true true true)
     (let ((result (oabs left)))
     (=> (oabs__function_guard result left) (dynamic_invariant result true
     false true true)))) :pattern ((oabs left)) )))

(declare-fun oand (Int Int) Bool)

(declare-fun oand__function_guard (Bool Int Int) Bool)

(declare-sort new_bool 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (new_bool new_bool) Bool)

(declare-const dummy2 new_bool)

(declare-datatypes ((new_bool__ref 0))
(((new_bool__refqtmk (new_bool__content new_bool)))))
(define-fun new_bool__ref_new_bool__content__projection ((a new_bool__ref)) new_bool 
  (new_bool__content a))

(define-fun dynamic_invariant2 ((temp___expr_204 Int)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (or (= temp___is_init_200 true)
                                     (<= 0 1)) (in_range2 temp___expr_204)))

;; oand__post_axiom
  (assert true)

(declare-fun omod (Int Int) Int)

(declare-fun omod__function_guard (Int Int Int) Bool)

;; omod__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (omod left right)))
     (=> (omod__function_guard result left right) (dynamic_invariant result
     true false true true)))) :pattern ((omod left right)) )))

(declare-fun onot (Int) Bool)

(declare-fun onot__function_guard (Bool Int) Bool)

;; onot__post_axiom
  (assert true)

(declare-fun oor (Int Int) Bool)

(declare-fun oor__function_guard (Bool Int Int) Bool)

;; oor__post_axiom
  (assert true)

(declare-fun orem (Int Int) Int)

(declare-fun orem__function_guard (Int Int Int) Bool)

;; orem__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (orem left right)))
     (=> (orem__function_guard result left right) (dynamic_invariant result
     true false true true)))) :pattern ((orem left right)) )))

(declare-fun oxor (Int Int) Bool)

(declare-fun oxor__function_guard (Bool Int Int) Bool)

;; oxor__post_axiom
  (assert true)

(declare-fun oeq (Int Int) Bool)

(declare-fun oeq__function_guard (Bool Int Int) Bool)

;; oeq__post_axiom
  (assert true)

(declare-fun olt (Int Int) Bool)

(declare-fun olt__function_guard (Bool Int Int) Bool)

;; olt__post_axiom
  (assert true)

(declare-fun ole (Int Int) Bool)

(declare-fun ole__function_guard (Bool Int Int) Bool)

;; ole__post_axiom
  (assert true)

(declare-fun ogt (Int Int) Bool)

(declare-fun ogt__function_guard (Bool Int Int) Bool)

;; ogt__post_axiom
  (assert true)

(declare-fun oge (Int Int) Bool)

(declare-fun oge__function_guard (Bool Int Int) Bool)

;; oge__post_axiom
  (assert true)

(declare-fun oadd (Int Int) Int)

(declare-fun oadd__function_guard (Int Int Int) Bool)

;; oadd__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (oadd left right)))
     (=> (oadd__function_guard result left right) (dynamic_invariant result
     true false true true)))) :pattern ((oadd left right)) )))

(declare-fun osubtract (Int Int) Int)

(declare-fun osubtract__function_guard (Int Int Int) Bool)

;; osubtract__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (osubtract left right)))
     (=> (osubtract__function_guard result left right) (dynamic_invariant
     result true false true true)))) :pattern ((osubtract left right)) )))

(declare-fun oconcat (Int Int) Int)

(declare-fun oconcat__function_guard (Int Int Int) Bool)

;; oconcat__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (oconcat left right)))
     (=> (oconcat__function_guard result left right) (dynamic_invariant
     result true false true true)))) :pattern ((oconcat left right)) )))

(declare-fun omultiply (Int Int) Int)

(declare-fun omultiply__function_guard (Int Int Int) Bool)

;; omultiply__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (omultiply left right)))
     (=> (omultiply__function_guard result left right) (dynamic_invariant
     result true false true true)))) :pattern ((omultiply left right)) )))

(declare-fun odivide (Int Int) Int)

(declare-fun odivide__function_guard (Int Int Int) Bool)

;; odivide__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (odivide left right)))
     (=> (odivide__function_guard result left right) (dynamic_invariant
     result true false true true)))) :pattern ((odivide left right)) )))

(declare-fun oexpon (Int Int) Int)

(declare-fun oexpon__function_guard (Int Int Int) Bool)

;; oexpon__post_axiom
  (assert
  (forall ((left Int) (right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant1
     right true true true true))
     (let ((result (oexpon left right)))
     (=> (oexpon__function_guard result left right) (dynamic_invariant result
     true false true true)))) :pattern ((oexpon left right)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(assert
;; defqtvc
 ;; File "x.adb", line 1, characters 0-0
  (not
  (forall ((a Int) (b Int) (c Int) (d Int))
  (=> (= a 0)
  (=> (dynamic_invariant1 a true false true true)
  (=> (= b 0)
  (=> (dynamic_invariant1 b true false true true)
  (=> (= c 0)
  (=> (dynamic_invariant2 c true false true true)
  (=> (= d 0)
  (=> (dynamic_invariant2 d true false true true)
  (=> (forall ((a1 Int) (b1 Int)) (oeq__function_guard (oeq a1 b1) a1 b1))
  (=> (= (oeq a b) true)
  (=> (forall ((a1 Int) (b1 Int)) (oeq__function_guard (oeq a1 b1) a1 b1))
  (=> (not (= (oeq a b) true))
  (=> (forall ((a1 Int) (b1 Int)) (olt__function_guard (olt a1 b1) a1 b1))
  (=> (= (olt a b) true)
  (=> (forall ((a1 Int) (b1 Int)) (ole__function_guard (ole a1 b1) a1 b1))
  (=> (= (ole a b) true)
  (=> (forall ((a1 Int) (b1 Int)) (ogt__function_guard (ogt a1 b1) a1 b1))
  (=> (= (ogt a b) true)
  (=> (forall ((a1 Int) (b1 Int)) (oge__function_guard (oge a1 b1) a1 b1))
  (= (oge a b) true)))))))))))))))))))))))
(check-sat)
(exit)
