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

(declare-fun is_valid (Int) Bool)

(declare-fun is_valid__function_guard (Bool Int) Bool)

(declare-sort value_t 0)

(declare-fun value_tqtint (value_t) Int)

;; value_t'axiom
  (assert
  (forall ((i value_t))
  (and (<= (- 2147483648) (value_tqtint i)) (<= (value_tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (value_t value_t) Bool)

(declare-const dummy value_t)

(declare-datatypes ()
((value_t__ref (value_t__refqtmk (value_t__content value_t)))))
(define-fun value_t__ref_value_t__content__projection ((a value_t__ref)) value_t 
  (value_t__content a))

(define-fun dynamic_invariant ((temp___expr_220 Int)
  (temp___is_init_216 Bool) (temp___skip_constant_217 Bool)
  (temp___do_toplevel_218 Bool)
  (temp___do_typ_inv_219 Bool)) Bool (=>
                                     (or (= temp___is_init_216 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_220)))

;; is_valid__post_axiom
  (assert true)

(define-fun to_rep ((x value_t)) Int (value_tqtint x))

(declare-fun of_rep (Int) value_t)

;; inversion_axiom
  (assert
  (forall ((x value_t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x value_t)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int value_t))))))
(declare-fun slide ((Array Int value_t) Int Int) (Array Int value_t))

;; slide_eq
  (assert
  (forall ((a (Array Int value_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int value_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int value_t)) (a__first Int) (a__last Int)
  (b (Array Int value_t)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int value_t)) (b (Array Int value_t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const va (Array Int value_t))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__usergroup_examples__value_cache_t__cached Bool)(rec__usergroup_examples__value_cache_t__cache value_t)))))
(define-fun us_split_fields_rec__usergroup_examples__value_cache_t__cached__projection ((a us_split_fields)) Bool 
  (rec__usergroup_examples__value_cache_t__cached a))

(define-fun us_split_fields_rec__usergroup_examples__value_cache_t__cache__projection ((a us_split_fields)) value_t 
  (rec__usergroup_examples__value_cache_t__cache a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__usergroup_examples__value_cache_t__cached
                                (us_split_fields1 a)) 1 0) (ite (rec__usergroup_examples__value_cache_t__cached
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__usergroup_examples__value_cache_t__cache
                           (us_split_fields1 a))) (to_rep
                                                  (rec__usergroup_examples__value_cache_t__cache
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const usergroup_examples__value_cache_t__cached__first__bit Int)

(declare-const usergroup_examples__value_cache_t__cached__last__bit Int)

(declare-const usergroup_examples__value_cache_t__cached__position Int)

;; usergroup_examples__value_cache_t__cached__first__bit_axiom
  (assert (<= 0 usergroup_examples__value_cache_t__cached__first__bit))

;; usergroup_examples__value_cache_t__cached__last__bit_axiom
  (assert
  (< usergroup_examples__value_cache_t__cached__first__bit usergroup_examples__value_cache_t__cached__last__bit))

;; usergroup_examples__value_cache_t__cached__position_axiom
  (assert (<= 0 usergroup_examples__value_cache_t__cached__position))

(declare-const usergroup_examples__value_cache_t__cache__first__bit Int)

(declare-const usergroup_examples__value_cache_t__cache__last__bit Int)

(declare-const usergroup_examples__value_cache_t__cache__position Int)

;; usergroup_examples__value_cache_t__cache__first__bit_axiom
  (assert (<= 0 usergroup_examples__value_cache_t__cache__first__bit))

;; usergroup_examples__value_cache_t__cache__last__bit_axiom
  (assert
  (< usergroup_examples__value_cache_t__cache__first__bit usergroup_examples__value_cache_t__cache__last__bit))

;; usergroup_examples__value_cache_t__cache__position_axiom
  (assert (<= 0 usergroup_examples__value_cache_t__cache__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((value_cache_t__ref
 (value_cache_t__refqtmk (value_cache_t__content us_rep)))))
(define-fun value_cache_t__ref_value_cache_t__content__projection ((a value_cache_t__ref)) us_rep 
  (value_cache_t__content a))

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int us_rep))))))
(declare-fun slide1 ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (bool_eq1 (select a temp___idx_156)
                              (select b (+ (- b__first a__first) temp___idx_156))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (bool_eq1 (select a temp___idx_156)
     (select b (+ (- b__first a__first) temp___idx_156))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort index_t 0)

(declare-fun index_tqtint (index_t) Int)

;; index_t'axiom
  (assert
  (forall ((i1 index_t))
  (and (<= 1 (index_tqtint i1)) (<= (index_tqtint i1) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (index_t index_t) Bool)

(declare-const dummy2 index_t)

(declare-datatypes ()
((index_t__ref (index_t__refqtmk (index_t__content index_t)))))
(define-fun index_t__ref_index_t__content__projection ((a index_t__ref)) index_t 
  (index_t__content a))

(define-fun dynamic_invariant1 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= 1 100)) (in_range2 temp___expr_173)))

(declare-const vca (Array Int us_rep))

(declare-const v Int)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 i true false true true))

;; Assume
  (assert (dynamic_invariant v false false true true))

;; H
  (assert
  (forall ((x Int)) (is_valid__function_guard
  (is_valid (to_rep (select va x))) (to_rep (select va x)))))

;; Assume
  (assert
  (and
  (forall ((x Int))
  (=> (and (<= 1 x) (<= x 100)) (= (is_valid (to_rep (select va x))) true)))
  (forall ((y Int))
  (=> (and (<= 1 y) (<= y 100))
  (=>
  (= (rec__usergroup_examples__value_cache_t__cached
     (us_split_fields1 (select vca y))) true)
  (= (to_rep
     (rec__usergroup_examples__value_cache_t__cache
     (us_split_fields1 (select vca y)))) (to_rep (select va y))))))))

(declare-const v1 Int)

(declare-const spark__branch Bool)

;; H
  (assert
  (= spark__branch (rec__usergroup_examples__value_cache_t__cached
                   (us_split_fields1 (select vca i)))))

(declare-const o Int)

(declare-const o1 value_t)

(declare-const vca1 (Array Int us_rep))

(declare-const vca2 (Array Int us_rep))

(declare-const o2 Int)

(declare-const o3 Int)

;; H
  (assert
  (ite (= spark__branch true)
  (and
  (= (to_rep
     (rec__usergroup_examples__value_cache_t__cache
     (us_split_fields1 (select vca i)))) o3)
  (= v1 o3))
  (and (= (to_rep (select va i)) o)
  (and (= (to_rep o1) o)
  (and
  (= vca1 (store vca i (us_repqtmk
                       (us_split_fieldsqtmk
                       (rec__usergroup_examples__value_cache_t__cached
                       (us_split_fields1 (select vca i))) o1))))
  (and
  (= vca2 (store vca1 i (us_repqtmk
                        (us_split_fieldsqtmk (distinct 1 0)
                        (rec__usergroup_examples__value_cache_t__cache
                        (us_split_fields1 (select vca1 i)))))))
  (and
  (= (to_rep
     (rec__usergroup_examples__value_cache_t__cache
     (us_split_fields1 (select vca2 i)))) o2)
  (= v1 o2))))))))

;; H
  (assert (is_valid__function_guard (is_valid (to_rep (select va i)))
  (to_rep (select va i))))

;; Assert
  (assert (= (is_valid (to_rep (select va i))) true))

;; H
  (assert (forall ((v2 Int)) (is_valid__function_guard (is_valid v2) v2)))

(assert
;; defqtvc
 ;; File "usergroup_examples.adb", line 85, characters 0-0
  (not (= (is_valid v1) true)))
(check-sat)
