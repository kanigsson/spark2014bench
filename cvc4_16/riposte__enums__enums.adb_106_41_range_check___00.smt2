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

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort big_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (big_type big_type) Bool)

(declare-const dummy1 big_type)

(declare-datatypes ((big_type__ref 0))
(((big_type__refqtmk (big_type__content big_type)))))
(define-fun big_type__ref_big_type__content__projection ((a1 big_type__ref)) big_type 
  (big_type__content a1))

(define-fun dynamic_invariant1 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 8)) (in_range1 temp___expr_169)))

(declare-sort smaller_type 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 3 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (smaller_type smaller_type) Bool)

(declare-const dummy2 smaller_type)

(declare-datatypes ((smaller_type__ref 0))
(((smaller_type__refqtmk (smaller_type__content smaller_type)))))
(define-fun smaller_type__ref_smaller_type__content__projection ((a1 smaller_type__ref)) smaller_type 
  (smaller_type__content a1))

(define-fun dynamic_invariant2 ((temp___expr_176 Int)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (<= 3 5)) (in_range2 temp___expr_176)))

(assert
;; defqtvc
 ;; File "enums.adb", line 105, characters 0-0
  (not
  (forall ((r Int) (r1 Int) (enums__tick_pos__result Int))
  (=> (dynamic_invariant1 a true false true true)
  (=> (dynamic_invariant r false false true true)
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= a 0) true false))
  (ite (= spark__branch true) (= r1 0)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= a 1) true false))
  (ite (= spark__branch1 true) (= r1 a)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= a 2) true false))
  (ite (= spark__branch2 true) (= r1 2)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= a 3) true false))
  (ite (= spark__branch3 true) (= r1 3)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (= a 4) true false))
  (ite (= spark__branch4 true)
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (in_range2 a) true false))
  (ite (= spark__branch5 true) (= r1 4) (= r1 0))))
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (= a 5) true false))
  (ite (= spark__branch5 true) (= r1 5)
  (exists ((spark__branch6 Bool))
  (and (= spark__branch6 (ite (= a 6) true false))
  (ite (= spark__branch6 true)
  (exists ((spark__branch7 Bool))
  (and (= spark__branch7 (ite (in_range2 a) true false))
  (ite (= spark__branch7 true) (= r1 0) (= r1 6))))
  (exists ((spark__branch7 Bool))
  (and (= spark__branch7 (ite (= a 8) true false))
  (ite (= spark__branch7 true) (= r1 8) (= r1 7)))))))))))))))))))))))))
  (=> (= enums__tick_pos__result r1) (in_range1 enums__tick_pos__result))))))))
(check-sat)
(exit)
