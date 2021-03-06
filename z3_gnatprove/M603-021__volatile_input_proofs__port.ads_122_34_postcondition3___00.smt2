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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun c3 ((_ BitVec 8)) Int)

(declare-fun c3__function_guard (Int (_ BitVec 8)) Bool)

(declare-sort source 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq (source source) Bool)

(declare-const dummy source)

(declare-datatypes ()
((source__ref (source__refqtmk (source__content source)))))
(define-fun source__ref_source__content__3__projection ((a source__ref)) source 
  (source__content a))

(define-fun dynamic_invariant ((temp___expr_212 (_ BitVec 8))
  (temp___is_init_208 Bool) (temp___skip_constant_209 Bool)
  (temp___do_toplevel_210 Bool) (temp___do_typ_inv_211 Bool)) Bool true)

(declare-sort target 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (target target) Bool)

(declare-const dummy1 target)

(declare-datatypes ()
((target__ref (target__refqtmk (target__content target)))))
(define-fun target__ref_target__content__2__projection ((a target__ref)) target 
  (target__content a))

(define-fun dynamic_invariant1 ((temp___expr_219 Int)
  (temp___is_init_215 Bool) (temp___skip_constant_216 Bool)
  (temp___do_toplevel_217 Bool)
  (temp___do_typ_inv_218 Bool)) Bool (=>
                                     (or (= temp___is_init_215 true)
                                     (<= 0 2)) (in_range1 temp___expr_219)))

;; c3__post_axiom
  (assert
  (forall ((s (_ BitVec 8)))
  (! (=> (dynamic_invariant s true true true true)
     (let ((result (c3 s)))
     (=> (c3__function_guard result s) (dynamic_invariant1 result true false
     true true)))) :pattern ((c3 s)) )))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort e 0)

(define-fun pos_to_rep ((x Int)) Int (ite (= x 2) 13 (ite (= x 1) 5 1)))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (e e) Bool)

(declare-const dummy2 e)

(declare-datatypes () ((e__ref (e__refqtmk (e__content e)))))
(define-fun e__ref_e__content__projection ((a e__ref)) e (e__content a))

(define-fun dynamic_invariant2 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 2)) (in_range2 temp___expr_161)))

(declare-sort u8 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 8))

(declare-fun user_eq3 (u8 u8) Bool)

(declare-const dummy3 u8)

(declare-datatypes () ((u8__ref (u8__refqtmk (u8__content u8)))))
(define-fun u8__ref_u8__content__projection ((a u8__ref)) u8 (u8__content a))

(define-fun dynamic_invariant3 ((temp___expr_175 (_ BitVec 8))
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool) (temp___do_typ_inv_174 Bool)) Bool true)

(declare-const veraw (_ BitVec 8))

(declare-const x Int)

(declare-const t Int)

(declare-const tmp (_ BitVec 8))

;; Assume
  (assert (dynamic_invariant3 veraw true false true true))

;; Assume
  (assert (dynamic_invariant2 x false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 t false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant3 tmp false false true true))

(declare-const veraw1 (_ BitVec 8))

;; Assume
  (assert (dynamic_invariant3 veraw1 true true true true))

(declare-const tmp1 (_ BitVec 8))

;; H
  (assert (= tmp1 veraw1))

(define-fun o () Int (c3 tmp1))

;; H
  (assert (c3__function_guard o tmp1))

;; H
  (assert (dynamic_invariant1 o true false true true))

(declare-const t1 Int)

;; H
  (assert (= t1 o))

(declare-const x1 Int)

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch true))

;; H
  (assert (ite (= spark__branch true) (= x1 t1) (= x1 0)))

(assert
;; defqtvc
 ;; File "port.ads", line 119, characters 0-0
  (not (in_range2 x1)))
(check-sat)

(exit)
