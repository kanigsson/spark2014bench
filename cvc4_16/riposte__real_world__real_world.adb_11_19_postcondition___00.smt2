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

(declare-const sort Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort enum_a 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 11)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (enum_a enum_a) Bool)

(declare-const dummy enum_a)

(declare-datatypes ((enum_a__ref 0))
(((enum_a__refqtmk (enum_a__content enum_a)))))
(define-fun enum_a__ref_enum_a__content__projection ((a enum_a__ref)) enum_a 
  (enum_a__content a))

(define-fun dynamic_invariant ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 0 11)) (in_range1 temp___expr_162)))

(declare-sort enum_b 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (enum_b enum_b) Bool)

(declare-const dummy1 enum_b)

(declare-datatypes ((enum_b__ref 0))
(((enum_b__refqtmk (enum_b__content enum_b)))))
(define-fun enum_b__ref_enum_b__content__projection ((a enum_b__ref)) enum_b 
  (enum_b__content a))

(define-fun dynamic_invariant1 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 5)) (in_range2 temp___expr_169)))

(assert
;; defqtvc
 ;; File "real_world.adb", line 10, characters 0-0
  (not
  (forall ((r Int) (r1 Int) (real_world__example_a__result Int))
  (=> (dynamic_invariant sort true false true true)
  (=> (dynamic_invariant1 r false false true true)
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= sort 2) true false))
  (ite (= spark__branch true) (= r1 3)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= sort 4) true false))
  (ite (= spark__branch1 true) (= r1 1)
  (exists ((spark__branch2 Bool))
  (and
  (= spark__branch2 (or (or (or (ite (= sort 5) true false) (ite (= sort 9)
                                                            true false)) 
  (ite (= sort 6) true false)) (ite (= sort 7) true false)))
  (ite (= spark__branch2 true) (= r1 2)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= sort 1) true false))
  (ite (= spark__branch3 true) (= r1 4)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (= sort 8) true false))
  (ite (= spark__branch4 true) (= r1 5) (= r1 0))))))))))))))))
  (=> (= real_world__example_a__result r1)
  (=> (= sort 2) (= real_world__example_a__result 3)))))))))
(check-sat)
(exit)
