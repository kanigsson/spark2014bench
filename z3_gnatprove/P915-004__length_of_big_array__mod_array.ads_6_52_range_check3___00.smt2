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

(declare-fun nth ((_ BitVec 64) Int) Bool)

(declare-fun lsr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2int x)
                                            (- (- 18446744073709551616 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 64))))))
(declare-fun power ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

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

(declare-sort my_index 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 64))

(declare-fun user_eq (my_index my_index) Bool)

(declare-const dummy my_index)

(declare-datatypes ()
((my_index__ref (my_index__refqtmk (my_index__content my_index)))))
(define-fun my_index__ref_my_index__content__projection ((a my_index__ref)) my_index 
  (my_index__content a))

(declare-fun to_rep (my_index) (_ BitVec 64))

(declare-fun of_rep ((_ BitVec 64)) my_index)

;; inversion_axiom
  (assert
  (forall ((x my_index))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 64)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int2 ((x my_index)) Int (bv2int (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x my_index)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array (_ BitVec 64) Bool))))))
(declare-fun slide ((Array (_ BitVec 64) Bool) (_ BitVec 64)
  (_ BitVec 64)) (Array (_ BitVec 64) Bool))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 64) Bool)))
  (forall ((first (_ BitVec 64)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 64) Bool)))
  (forall ((old_first (_ BitVec 64)))
  (forall ((new_first (_ BitVec 64)))
  (forall ((i (_ BitVec 64)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 64) Bool)) (a__first (_ BitVec 64))
  (a__last (_ BitVec 64)) (b (Array (_ BitVec 64) Bool))
  (b__first (_ BitVec 64))
  (b__last (_ BitVec 64))) Bool (ite (and
                                     (ite (bvule a__first a__last)
                                     (and (bvule b__first b__last)
                                     (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                     (bvugt b__first b__last))
                                     (forall ((temp___idx_154 (_ BitVec 64)))
                                     (=>
                                     (and (bvule a__first temp___idx_154)
                                     (bvule temp___idx_154 a__last))
                                     (= (ite (select a temp___idx_154) 1 0) (ite (select b (bvadd (bvsub b__first a__first) temp___idx_154)) 1 0)))))
                                true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 64) Bool)) (b (Array (_ BitVec 64) Bool)))
  (forall ((a__first (_ BitVec 64)) (a__last (_ BitVec 64))
  (b__first (_ BitVec 64)) (b__last (_ BitVec 64)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_154 (_ BitVec 64)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (bvadd (bvsub b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-sort t 0)

(declare-fun first (t) my_index)

(declare-fun last (t) my_index)

(declare-fun mk ((_ BitVec 64) (_ BitVec 64)) t)

;; mk_def
  (assert
  (forall ((f (_ BitVec 64)) (l (_ BitVec 64)))
  (! (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first (_ BitVec 64))
  (range_last (_ BitVec 64)) (low (_ BitVec 64))
  (high (_ BitVec 64))) Bool true)

(declare-datatypes ()
((us_t (us_tqtmk (elts (Array (_ BitVec 64) Bool))(rt t)))))
(define-fun to_array ((a us_t)) (Array (_ BitVec 64) Bool) (elts a))

(define-fun of_array ((a (Array (_ BitVec 64) Bool)) (f (_ BitVec 64))
  (l (_ BitVec 64))) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) (_ BitVec 64) (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) (_ BitVec 64) (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (bvule (first1 a) (last1 a))
                                  (+ (- (bv2int (last1 a)) (bv2int (first1 a))) 1)
                                  0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq1 (us_t us_t) Bool)

(declare-const dummy1 us_t)

(declare-datatypes () ((a__ref (a__refqtmk (a__content us_t)))))
(define-fun a__ref_a__content__projection ((a a__ref)) us_t (a__content a))

(declare-const x us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_167 us_t)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (not (= temp___skip_constant_164 true))
                                     (dynamic_property #x0000000000000000
                                     #xFFFFFFFFFFFFFFFF
                                     (first1 temp___expr_167)
                                     (last1 temp___expr_167))))

(define-fun dynamic_invariant1 ((temp___expr_160 (_ BitVec 64))
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool) (temp___do_typ_inv_159 Bool)) Bool true)

;; Assume
  (assert (dynamic_invariant x true false true true))

(assert
;; defqtvc
 ;; File "mod_array.ads", line 6, characters 0-0
  (not (uint_in_range (length x))))
(check-sat)

(exit)
