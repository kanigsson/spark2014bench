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

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

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

(declare-const a (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun id ((_ BitVec 8)) (_ BitVec 8))

(declare-fun id__function_guard ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-sort my_mod 0)

(define-fun in_range ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                             (bvule x #xFE)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 254)))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 8))

(declare-fun user_eq (my_mod my_mod) Bool)

(declare-const dummy my_mod)

(declare-datatypes ()
((my_mod__ref (my_mod__refqtmk (my_mod__content my_mod)))))
(define-fun my_mod__ref_my_mod__content__projection ((a1 my_mod__ref)) my_mod 
  (my_mod__content a1))

(define-fun dynamic_invariant ((temp___expr_163 (_ BitVec 8))
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (bvule #x00 #xFE)) (in_range
                                     temp___expr_163)))

;; id__post_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((id x)) )))

;; id__def_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (=> (dynamic_invariant x true true true true) (= (id x) x)) :pattern (
  (id x)) )))

;; a__def_axiom
  (assert (and (id__function_guard (id #x02) #x02) (= a (id #x02))))

;; b__def_axiom
  (assert (and (id__function_guard (id #xFE) #xFE) (= b (id #xFE))))

;; c__def_axiom
  (assert (and (id__function_guard (id #x00) #x00) (= c (id #x00))))

(define-fun mod_types__a__assume () (_ BitVec 8) (id #x02))

;; H
  (assert (id__function_guard mod_types__a__assume #x02))

;; H
  (assert (dynamic_invariant mod_types__a__assume true false true true))

;; H
  (assert (= mod_types__a__assume #x02))

;; Assume
  (assert (= mod_types__a__assume a))

;; Assume
  (assert (dynamic_invariant a true false true true))

(define-fun mod_types__b__assume () (_ BitVec 8) (id #xFE))

;; H
  (assert (id__function_guard mod_types__b__assume #xFE))

;; H
  (assert (dynamic_invariant mod_types__b__assume true false true true))

;; H
  (assert (= mod_types__b__assume #xFE))

;; Assume
  (assert (= mod_types__b__assume b))

;; Assume
  (assert (dynamic_invariant b true false true true))

(define-fun mod_types__c__assume () (_ BitVec 8) (id #x00))

;; H
  (assert (id__function_guard mod_types__c__assume #x00))

;; H
  (assert (dynamic_invariant mod_types__c__assume true false true true))

;; H
  (assert (= mod_types__c__assume #x00))

;; Assume
  (assert (= mod_types__c__assume c))

;; Assume
  (assert (dynamic_invariant c true false true true))

(assert
;; defqtvc
 ;; File "mod_types.ads", line 1, characters 0-0
  (not
  (= (let ((temp___167 (bvadd a b)))
     (ite (bvule (bvsub #xFF a) b) (bvsub temp___167 #xFF) temp___167)) 
  c)))
(check-sat)

(exit)
