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

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort ttB 0)

(declare-fun ttBqtint (ttB) Int)

;; ttB'axiom
  (assert
  (forall ((i ttB)) (and (<= (- 128) (ttBqtint i)) (<= (ttBqtint i) 127))))

(define-fun in_range ((x1 Int)) Bool (and (<= (- 128) x1) (<= x1 127)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (ttB ttB) Bool)

(declare-const dummy ttB)

(declare-datatypes ((ttB__ref 0))
(((ttB__refqtmk (ttB__content ttB)))))
(define-fun ttB__ref_ttB__content__projection ((a ttB__ref)) ttB (ttB__content
                                                                 a))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert (forall ((i t)) (and (<= 1 (tqtint i)) (<= (tqtint i) 127))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 127)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t t) Bool)

(declare-const dummy1 t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 1 127)) (in_range1 temp___expr_186)))

(assert
;; defqtvc
 ;; File "minmax.adb", line 50, characters 0-0
  (not
  (forall ((mint Int) (maxt Int))
  (=> (dynamic_invariant mint false false true true)
  (=> (dynamic_invariant maxt false false true true)
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (=> (< x y)
  (let ((o (min x y)))
  (=> (in_range1 o)
  (forall ((mint1 Int))
  (=> (= mint1 o)
  (let ((o1 (max x y)))
  (=> (in_range1 o1)
  (forall ((maxt1 Int))
  (=> (= maxt1 o1)
  (=> (= mint1 x)
  (=> (= maxt1 y)
  (let ((o2 (+ x y)))
  (=> (in_range o2)
  (let ((o3 (min x o2)))
  (=> (in_range1 o3)
  (forall ((mint2 Int))
  (=> (= mint2 o3)
  (let ((o4 (+ x y)))
  (=> (in_range o4)
  (let ((o5 (max o4 y)))
  (=> (in_range1 o5) (forall ((maxt2 Int)) (=> (= maxt2 o5) (= mint2 x)))))))))))))))))))))))))))))))
(check-sat)
(exit)
