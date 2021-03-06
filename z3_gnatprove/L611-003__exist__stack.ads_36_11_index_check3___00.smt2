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

(declare-sort element_t 0)

(declare-fun element_tqtint (element_t) Int)

;; element_t'axiom
  (assert
  (forall ((i element_t))
  (and (<= (- 1) (element_tqtint i)) (<= (element_tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 1) x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (element_t element_t) Bool)

(declare-const dummy element_t)

(declare-datatypes ()
((element_t__ref (element_t__refqtmk (element_t__content element_t)))))
(define-fun element_t__ref_element_t__content__projection ((a element_t__ref)) element_t 
  (element_t__content a))

(define-fun to_rep ((x element_t)) Int (element_tqtint x))

(declare-fun of_rep (Int) element_t)

;; inversion_axiom
  (assert
  (forall ((x element_t))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x element_t)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int element_t))))))
(declare-fun slide ((Array Int element_t) Int Int) (Array Int element_t))

;; slide_eq
  (assert
  (forall ((a (Array Int element_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element_t)) (a__first Int) (a__last Int)
  (b (Array Int element_t)) (b__first Int)
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
  (forall ((a (Array Int element_t)) (b (Array Int element_t)))
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

(declare-const t (Array Int element_t))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const s Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort size_t 0)

(declare-fun size_tqtint (size_t) Int)

;; size_t'axiom
  (assert
  (forall ((i size_t)) (and (<= 0 (size_tqtint i)) (<= (size_tqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (size_t size_t) Bool)

(declare-const dummy1 size_t)

(declare-datatypes ()
((size_t__ref (size_t__refqtmk (size_t__content size_t)))))
(define-fun size_t__ref_size_t__content__projection ((a size_t__ref)) size_t 
  (size_t__content a))

(define-fun dynamic_invariant ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 100)) (in_range2 temp___expr_163)))

(declare-sort index_t 0)

(declare-fun index_tqtint (index_t) Int)

;; index_t'axiom
  (assert
  (forall ((i index_t))
  (and (<= 1 (index_tqtint i)) (<= (index_tqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index_t index_t) Bool)

(declare-const dummy2 index_t)

(declare-datatypes ()
((index_t__ref (index_t__refqtmk (index_t__content index_t)))))
(define-fun index_t__ref_index_t__content__projection ((a index_t__ref)) index_t 
  (index_t__content a))

(define-fun dynamic_invariant1 ((temp___expr_170 Int)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=>
                                     (or (= temp___is_init_166 true)
                                     (<= (- 1) 2147483647)) (in_range1
                                     temp___expr_170)))

(define-fun dynamic_invariant2 ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 1 100)) (in_range3 temp___expr_177)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant s true false true true))

(declare-const usf Int)

;; H
  (assert
  (= (and (ite (<= 1 usf) true false) (ite (<= usf s) true false)) true))

(assert
;; defqtvc
 ;; File "stack.ads", line 15, characters 0-0
  (not (<= 1 usf)))
(check-sat)

(exit)
