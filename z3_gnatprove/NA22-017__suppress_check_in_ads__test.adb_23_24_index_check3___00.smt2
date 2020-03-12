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

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

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

(declare-fun xor2 ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(declare-fun xor2__function_guard ((_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(declare-sort word32 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 32))

(declare-fun user_eq (word32 word32) Bool)

(declare-const dummy word32)

(declare-datatypes ()
((word32__ref (word32__refqtmk (word32__content word32)))))
(define-fun word32__ref_word32__content__projection ((a word32__ref)) word32 
  (word32__content a))

(define-fun dynamic_invariant ((temp___expr_174 (_ BitVec 32))
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool) (temp___do_typ_inv_173 Bool)) Bool true)

;; xor2__post_axiom
  (assert
  (forall ((v0 (_ BitVec 32)) (v1 (_ BitVec 32)))
  (! (=>
     (and (dynamic_invariant v0 true true true true) (dynamic_invariant v1
     true true true true))
     (let ((result (xor2 v0 v1)))
     (=> (xor2__function_guard result v0 v1)
     (and (= result (bvxor v0 v1)) (dynamic_invariant result true false true
     true))))) :pattern ((xor2 v0 v1)) )))

(declare-sort tindexB 0)

(declare-fun tindexBqtint (tindexB) Int)

;; tindexB'axiom
  (assert
  (forall ((i tindexB))
  (and (<= (- 128) (tindexBqtint i)) (<= (tindexBqtint i) 127))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tindexB tindexB) Bool)

(declare-const dummy1 tindexB)

(declare-datatypes ()
((tindexB__ref (tindexB__refqtmk (tindexB__content tindexB)))))
(define-fun tindexB__ref_tindexB__content__projection ((a tindexB__ref)) tindexB 
  (tindexB__content a))

(define-fun to_rep ((x tindexB)) Int (tindexBqtint x))

(declare-fun of_rep (Int) tindexB)

;; inversion_axiom
  (assert
  (forall ((x tindexB)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x tindexB)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 79))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 79)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-fun to_rep1 (word32) (_ BitVec 32))

(declare-fun of_rep1 ((_ BitVec 32)) word32)

;; inversion_axiom
  (assert
  (forall ((x word32))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 32)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int2 ((x word32)) Int (bv2int (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x word32)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int word32))))))
(declare-fun slide ((Array Int word32) Int Int) (Array Int word32))

;; slide_eq
  (assert
  (forall ((a (Array Int word32)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int word32)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int word32)) (a__first Int) (a__last Int)
  (b (Array Int word32)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int word32)) (b (Array Int word32)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) tindexB)

(declare-fun last (t) tindexB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int word32))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int word32) (elts a))

(define-fun of_array ((a (Array Int word32)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((word32_array_type__ref
 (word32_array_type__refqtmk (word32_array_type__content us_t)))))
(define-fun word32_array_type__ref_word32_array_type__content__projection ((a word32_array_type__ref)) us_t 
  (word32_array_type__content a))

(declare-const left us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const result____first tindexB)

(declare-const result____last tindexB)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_181 us_t)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (not (= temp___skip_constant_178 true))
                                     (dynamic_property 0 79
                                     (first1 temp___expr_181)
                                     (last1 temp___expr_181))))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tindexB tindexB) Bool)

(declare-const dummy4 tindexB)

(declare-datatypes () ((t5b__ref (t5b__refqtmk (t5b__content tindexB)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) tindexB 
  (t5b__content a))

(define-fun dynamic_invariant2 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 0 79)) (in_range2 temp___expr_160)))

(declare-const result__ (Array Int word32))

;; Assume
  (assert (dynamic_invariant1 left true false true true))

;; Assume
  (assert (dynamic_invariant1 right true false true true))

;; Assume
  (assert (dynamic_property 0 79 (to_rep result____first)
  (to_rep result____last)))

;; Assume
  (assert
  (and
  (and (and (= (first1 left) (first1 right)) (= (last1 left) (last1 right)))
  (= (first1 right) (to_rep result____first)))
  (= (last1 right) (to_rep result____last))))

(declare-const temp___253 Int)

;; Ensures
  (assert (= (to_rep result____first) temp___253))

(declare-const temp___254 Int)

;; Ensures
  (assert (= (to_rep result____last) temp___254))

(declare-const i Int)

;; H
  (assert (= i temp___253))

;; H
  (assert
  (= (and (ite (<= temp___253 i) true false) (ite (<= i temp___254) true
                                             false)) true))

;; Assert
  (assert (and (<= (first1 right) i) (<= i (last1 right))))

(declare-const o (_ BitVec 32))

;; Ensures
  (assert (= (to_rep1 (select (to_array right) i)) o))

;; Assert
  (assert (and (<= (first1 left) i) (<= i (last1 left))))

(declare-const o1 (_ BitVec 32))

;; Ensures
  (assert (= (to_rep1 (select (to_array left) i)) o1))

(define-fun o2 () (_ BitVec 32) (xor2 o1 o))

;; H
  (assert (xor2__function_guard o2 o1 o))

;; H
  (assert (dynamic_invariant o2 true false true true))

;; H
  (assert (= o2 (bvxor o1 o)))

(declare-const o3 word32)

;; Ensures
  (assert (= (to_rep1 o3) o2))

(declare-const result__1 (Array Int word32))

;; H
  (assert (= result__1 (store result__ i o3)))

(declare-const usf Int)

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep result____first) o4))

;; H
  (assert
  (= (and (ite (<= o4 usf) true false) (ite (<= usf i) true false)) true))

;; Assert
  (assert (and (<= (first1 right) usf) (<= usf (last1 right))))

(declare-const o5 (_ BitVec 32))

;; Ensures
  (assert (= (to_rep1 (select (to_array right) usf)) o5))

;; Assert
  (assert (and (<= (first1 left) usf) (<= usf (last1 left))))

(declare-const o6 (_ BitVec 32))

;; Ensures
  (assert (= (to_rep1 (select (to_array left) usf)) o6))

(define-fun o7 () (_ BitVec 32) (xor2 o6 o5))

;; H
  (assert (xor2__function_guard o7 o6 o5))

;; H
  (assert (dynamic_invariant o7 true false true true))

;; H
  (assert (= o7 (bvxor o6 o5)))

(assert
;; defqtvc
 ;; File "test.ads", line 17, characters 0-0
  (not (<= (to_rep result____first) usf)))
(check-sat)
