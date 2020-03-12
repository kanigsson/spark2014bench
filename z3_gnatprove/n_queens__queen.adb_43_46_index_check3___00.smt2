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

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 8))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (index index) Bool)

(declare-const dummy index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun to_rep ((x index)) Int (indexqtint x))

(declare-fun of_rep (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int index))))))
(declare-fun slide ((Array Int index) Int Int) (Array Int index))

;; slide_eq
  (assert
  (forall ((a (Array Int index)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int index)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int index)) (a__first Int) (a__last Int)
  (b (Array Int index)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int index)) (b (Array Int index)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-fun consistent ((Array Int index) Int) Bool)

(declare-fun consistent__function_guard (Bool (Array Int index) Int) Bool)

(define-fun dynamic_invariant ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 1 8)) (in_range1 temp___expr_162)))

;; consistent__post_axiom
  (assert true)

;; consistent__def_axiom
  (assert
  (forall ((b (Array Int index)))
  (forall ((k Int))
  (! (= (= (consistent b k) true)
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i k))
     (forall ((j Int))
     (=> (and (<= 1 j) (<= j (- i 1)))
     (and
     (and (not (= (to_rep (select b i)) (to_rep (select b j))))
     (not (= (- i j) (- (to_rep (select b i)) (to_rep (select b j))))))
     (not (= (- i j) (- (to_rep (select b j)) (to_rep (select b i))))))))))) :pattern (
  (consistent b k)) ))))

(declare-fun copy_until ((Array Int index) Int
  (Array Int index)) (Array Int index))

(declare-fun copy_until__function_guard ((Array Int index) (Array Int index)
  Int (Array Int index)) Bool)

;; copy_until__post_axiom
  (assert
  (forall ((b (Array Int index)) (c (Array Int index)))
  (forall ((i Int))
  (! (=> (dynamic_invariant i true true true true)
     (let ((result (copy_until b i c)))
     (=> (copy_until__function_guard result b i c)
     (forall ((j Int))
     (=> (and (<= 1 j) (<= j i))
     (= (to_rep (select result j)) (to_rep (select b j)))))))) :pattern (
  (copy_until b i c)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const c (Array Int index))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const b (Array Int index))

(declare-const done__ Bool)

(declare-const b1 (Array Int index))

;; H
  (assert (= b1 b))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant i true false true true))

;; Assume
  (assert true)

;; H
  (assert
  (forall ((b2 (Array Int index))) (consistent__function_guard
  (consistent b2 (- i 1)) b2 (- i 1))))

;; Assume
  (assert
  (and
  (and (not (= done__ true))
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j (- i 1)))
  (= (to_rep (select c j)) (to_rep (select b j))))))
  (=> (< 1 i) (= (consistent b (- i 1)) true))))

(declare-const r Int)

;; H
  (assert (= r 1))

;; H
  (assert (= (and (ite (<= 1 r) true false) (ite (<= r 8) true false)) true))

(declare-const temp___loop_entry_236 (Array Int index))

;; H
  (assert (= temp___loop_entry_236 b))

(declare-const o Bool)

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep (select c i)) o1))

;; H
  (assert
  (ite (< o1 r)
  (let ((o2 c))
  (let ((o3 (consistent o2 8)))
  (and
  (and (consistent__function_guard o3 o2 8)
  (= (= o3 true)
  (forall ((i1 Int))
  (=> (and (<= 1 i1) (<= i1 8))
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j (- i1 1)))
  (and
  (and (not (= (to_rep (select o2 i1)) (to_rep (select o2 j))))
  (not (= (- i1 j) (- (to_rep (select o2 i1)) (to_rep (select o2 j))))))
  (not (= (- i1 j) (- (to_rep (select o2 j)) (to_rep (select o2 i1))))))))))))
  (= o (ite (= o3 true) false true))))) (= o (distinct 1 0))))

(declare-const usf Int)

;; H
  (assert
  (= (and (ite (<= 1 usf) true false) (ite (<= usf (- i 1)) true false)) true))

;; Assert
  (assert (and (<= 1 usf) (<= usf 8)))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep (select temp___loop_entry_236 usf)) o2))

(assert
;; defqtvc
 ;; File "queen.ads", line 47, characters 0-0
  (not (<= 1 usf)))
(check-sat)
