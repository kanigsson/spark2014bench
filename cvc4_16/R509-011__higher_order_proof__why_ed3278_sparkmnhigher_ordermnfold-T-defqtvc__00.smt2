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

(declare-fun value (Int) Int)

(declare-fun value__function_guard (Int Int) Bool)

(declare-sort my_small 0)

(declare-fun my_smallqtint (my_small) Int)

;; my_small'axiom
  (assert
  (forall ((i my_small))
  (and (<= (- 100) (my_smallqtint i)) (<= (my_smallqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 100) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (my_small my_small) Bool)

(declare-const dummy1 my_small)

(declare-datatypes ((my_small__ref 0))
(((my_small__refqtmk (my_small__content my_small)))))
(define-fun my_small__ref_my_small__content__projection ((a my_small__ref)) my_small 
  (my_small__content a))

(define-fun dynamic_invariant1 ((temp___expr_203 Int)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (or (= temp___is_init_199 true)
                                     (<= (- 100) 100)) (in_range2
                                     temp___expr_203)))

;; value__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (value x)))
     (=> (value__function_guard result x) (dynamic_invariant1 result true
     false true true)))) :pattern ((value x)) )))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort element_in 0)

(declare-fun element_inqtint (element_in) Int)

;; element_in'axiom
  (assert
  (forall ((i element_in))
  (and (<= (- 2147483648) (element_inqtint i))
  (<= (element_inqtint i) 2147483647))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= (- 2147483648) x1)
                                      (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (element_in element_in) Bool)

(declare-const dummy2 element_in)

(declare-datatypes ((element_in__ref 0))
(((element_in__refqtmk (element_in__content element_in)))))
(define-fun element_in__ref_element_in__content__3__projection ((a element_in__ref)) element_in 
  (element_in__content a))

(define-fun dynamic_invariant2 ((temp___expr_462 Int)
  (temp___is_init_458 Bool) (temp___skip_constant_459 Bool)
  (temp___do_toplevel_460 Bool)
  (temp___do_typ_inv_461 Bool)) Bool (=>
                                     (or (= temp___is_init_458 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_462)))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 593, characters 0-0
  (not
  (=> (dynamic_invariant2 x true false true true)
  (=> (dynamic_invariant y true false true true)
  (=> (<= (- 2147483548) y)
  (=> (<= y 2147483547)
  (let ((o x))
  (let ((o1 (value o)))
  (=>
  (and (value__function_guard o1 o) (dynamic_invariant1 o1 true false true
  true))
  (let ((o2 (+ o1 y)))
  (=> (in_range1 o2)
  (forall ((test_higher_order3__my_sum_2__add_value__result Int))
  (=> (= test_higher_order3__my_sum_2__add_value__result o2)
  (let ((o3 x))
  (let ((o4 (value o3)))
  (=>
  (and (value__function_guard o4 o3) (dynamic_invariant1 o4 true false true
  true)) (in_range1 (+ o4 y))))))))))))))))))
(check-sat)
(exit)
