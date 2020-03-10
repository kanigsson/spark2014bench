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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort ttotalB 0)

(declare-fun ttotalBqtint (ttotalB) Int)

;; ttotalB'axiom
  (assert
  (forall ((i ttotalB))
  (and (<= (- 128) (ttotalBqtint i)) (<= (ttotalBqtint i) 127))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (ttotalB ttotalB) Bool)

(declare-const dummy ttotalB)

(declare-datatypes ((ttotalB__ref 0))
(((ttotalB__refqtmk (ttotalB__content ttotalB)))))
(define-fun ttotalB__ref_ttotalB__content__projection ((a ttotalB__ref)) ttotalB 
  (ttotalB__content a))

(declare-sort total 0)

(declare-fun totalqtint (total) Int)

;; total'axiom
  (assert
  (forall ((i total)) (and (<= 1 (totalqtint i)) (<= (totalqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (total total) Bool)

(declare-const dummy1 total)

(declare-datatypes ((total__ref 0))
(((total__refqtmk (total__content total)))))
(define-fun total__ref_total__content__projection ((a total__ref)) total 
  (total__content a))

(define-fun dynamic_invariant ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 1 100)) (in_range2 temp___expr_179)))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert (forall ((i t)) (and (<= 1 (tqtint i)) (<= (tqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t t) Bool)

(declare-const dummy2 t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 1 10)) (in_range3 temp___expr_186)))

(assert
;; defqtvc
 ;; File "loop_var_loop_invar.adb", line 1, characters 0-0
  (not
  (forall ((i Int) (r Int))
  (=> (= i 1)
  (=> (dynamic_invariant1 i true false true true)
  (=> (= r 100)
  (=> (dynamic_invariant r true false true true)
  (=> (< i 10)
  (let ((o (* 10 i)))
  (=> (in_range1 o)
  (=> (in_range1 (- 100 o))
  (forall ((i1 Int) (r1 Int))
  (=> (<= (- 100 (* 10 i1)) r1)
  (=>
  (= (and (ite (and (dynamic_invariant1 i1 true true true true)
               (dynamic_invariant r1 true true true true))
          true false) (ite (< i1 10) true false)) true)
  (forall ((temp___193 Int))
  (=> (= temp___193 i1)
  (forall ((temp___192 Int))
  (=> (= temp___192 r1)
  (let ((o1 (- r1 i1)))
  (=> (in_range2 o1)
  (forall ((r2 Int))
  (=> (= r2 o1)
  (let ((o2 (+ i1 1)))
  (=> (in_range3 o2)
  (forall ((i2 Int))
  (=> (= i2 o2)
  (=> (< i2 10)
  (or (< temp___193 i2) (and (= i2 temp___193) (< r2 temp___192))))))))))))))))))))))))))))))
(check-sat)
(exit)
