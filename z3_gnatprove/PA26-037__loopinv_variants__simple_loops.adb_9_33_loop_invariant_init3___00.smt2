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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-sort t1b 0)

(declare-fun t1bqtint (t1b) Int)

;; t1b'axiom
  (assert (forall ((i t1b)) (and (<= 1 (t1bqtint i)) (<= (t1bqtint i) 3))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (t1b t1b) Bool)

(declare-const dummy t1b)

(declare-datatypes () ((t1b__ref (t1b__refqtmk (t1b__content t1b)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) t1b (t1b__content
                                                                 a))

(declare-sort t2b 0)

(declare-fun t2bqtint (t2b) Int)

;; t2b'axiom
  (assert (forall ((i t2b)) (and (<= 1 (t2bqtint i)) (<= (t2bqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (t2b t2b) Bool)

(declare-const dummy1 t2b)

(declare-datatypes () ((t2b__ref (t2b__refqtmk (t2b__content t2b)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) t2b (t2b__content
                                                                 a))

(declare-sort t3b 0)

(declare-fun t3bqtint (t3b) Int)

;; t3b'axiom
  (assert (forall ((i t3b)) (and (<= 1 (t3bqtint i)) (<= (t3bqtint i) 3))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t3b t3b) Bool)

(declare-const dummy2 t3b)

(declare-datatypes () ((t3b__ref (t3b__refqtmk (t3b__content t3b)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) t3b (t3b__content
                                                                 a))

(declare-sort t4b 0)

(declare-fun t4bqtint (t4b) Int)

;; t4b'axiom
  (assert (forall ((i t4b)) (and (<= 1 (t4bqtint i)) (<= (t4bqtint i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (t4b t4b) Bool)

(declare-const dummy3 t4b)

(declare-datatypes () ((t4b__ref (t4b__refqtmk (t4b__content t4b)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) t4b (t4b__content
                                                                 a))

(declare-sort t5b 0)

(declare-fun t5bqtint (t5b) Int)

;; t5b'axiom
  (assert (forall ((i t5b)) (and (<= 1 (t5bqtint i)) (<= (t5bqtint i) 3))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (t5b t5b) Bool)

(declare-const dummy4 t5b)

(declare-datatypes () ((t5b__ref (t5b__refqtmk (t5b__content t5b)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) t5b (t5b__content
                                                                 a))

(declare-sort t6b 0)

(declare-fun t6bqtint (t6b) Int)

;; t6b'axiom
  (assert (forall ((i t6b)) (and (<= 1 (t6bqtint i)) (<= (t6bqtint i) 10))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (t6b t6b) Bool)

(declare-const dummy5 t6b)

(declare-datatypes () ((t6b__ref (t6b__refqtmk (t6b__content t6b)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) t6b (t6b__content
                                                                 a))

(declare-sort t7b 0)

(declare-fun t7bqtint (t7b) Int)

;; t7b'axiom
  (assert (forall ((i t7b)) (and (<= 1 (t7bqtint i)) (<= (t7bqtint i) 3))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (t7b t7b) Bool)

(declare-const dummy6 t7b)

(declare-datatypes () ((t7b__ref (t7b__refqtmk (t7b__content t7b)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) t7b (t7b__content
                                                                 a))

(declare-sort t8b 0)

(declare-fun t8bqtint (t8b) Int)

;; t8b'axiom
  (assert (forall ((i t8b)) (and (<= 1 (t8bqtint i)) (<= (t8bqtint i) 10))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq7 (t8b t8b) Bool)

(declare-const dummy7 t8b)

(declare-datatypes () ((t8b__ref (t8b__refqtmk (t8b__content t8b)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) t8b (t8b__content
                                                                 a))

(declare-const prop Bool)

(declare-const i Int)

;; H
  (assert (= i 1))

;; H
  (assert (= (and (ite (<= 1 i) true false) (ite (<= i 3) true false)) true))

(declare-const prop1 Bool)

;; H
  (assert (= prop1 (distinct 0 0)))

(declare-const j Int)

;; H
  (assert (= j 1))

;; H
  (assert
  (= (and (ite (<= 1 j) true false) (ite (<= j 10) true false)) true))

(assert
;; defqtvc
 ;; File "simple_loops.adb", line 1, characters 0-0
  (not (= prop1 true)))
(check-sat)

(exit)
