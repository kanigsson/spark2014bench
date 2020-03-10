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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const cat1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const cat2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort category 0)

(declare-fun categoryqtint (category) Int)

;; category'axiom
  (assert
  (forall ((i category))
  (and (<= 1 (categoryqtint i)) (<= (categoryqtint i) 8))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (category category) Bool)

(declare-const dummy1 category)

(declare-datatypes ((category__ref 0))
(((category__refqtmk (category__content category)))))
(define-fun category__ref_category__content__projection ((a category__ref)) category 
  (category__content a))

(define-fun to_rep1 ((x category)) Int (categoryqtint x))

(declare-fun of_rep1 (Int) category)

;; inversion_axiom
  (assert
  (forall ((x category))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x category)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__counter_example__item__cat category)(rec__counter_example__item__idx natural)))))
(define-fun us_split_fields_rec__counter_example__item__cat__projection ((a us_split_fields)) category 
  (rec__counter_example__item__cat a))

(define-fun us_split_fields_rec__counter_example__item__idx__projection ((a us_split_fields)) natural 
  (rec__counter_example__item__idx a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__counter_example__item__cat
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__counter_example__item__cat
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__counter_example__item__idx
                           (us_split_fields1 a))) (to_rep
                                                  (rec__counter_example__item__idx
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

(declare-const counter_example__item__cat__first__bit Int)

(declare-const counter_example__item__cat__last__bit Int)

(declare-const counter_example__item__cat__position Int)

;; counter_example__item__cat__first__bit_axiom
  (assert (<= 0 counter_example__item__cat__first__bit))

;; counter_example__item__cat__last__bit_axiom
  (assert
  (< counter_example__item__cat__first__bit counter_example__item__cat__last__bit))

;; counter_example__item__cat__position_axiom
  (assert (<= 0 counter_example__item__cat__position))

(declare-const counter_example__item__idx__first__bit Int)

(declare-const counter_example__item__idx__last__bit Int)

(declare-const counter_example__item__idx__position Int)

;; counter_example__item__idx__first__bit_axiom
  (assert (<= 0 counter_example__item__idx__first__bit))

;; counter_example__item__idx__last__bit_axiom
  (assert
  (< counter_example__item__idx__first__bit counter_example__item__idx__last__bit))

;; counter_example__item__idx__position_axiom
  (assert (<= 0 counter_example__item__idx__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((item__ref 0))
(((item__refqtmk (item__content us_rep)))))
(define-fun item__ref_item__content__projection ((a item__ref)) us_rep 
  (item__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
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
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((num_item_t__ref 0))
(((num_item_t__refqtmk (num_item_t__content us_t)))))
(define-fun num_item_t__ref_num_item_t__content__projection ((a num_item_t__ref)) us_t 
  (num_item_t__content a))

(declare-const num_item_per_category us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun pick_last (Int) Int)

(declare-fun pick_last__function_guard (Int Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_174 Int)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (<= 1 8)) (in_range2 temp___expr_174)))

;; pick_last__post_axiom
  (assert
  (forall ((cat Int))
  (! (=> (dynamic_invariant1 cat true true true true)
     (let ((result (pick_last cat)))
     (=> (pick_last__function_guard result cat) (dynamic_invariant result
     true false true true)))) :pattern ((pick_last cat)) )))

;; pick_last__def_axiom
  (assert
  (forall ((cat Int))
  (! (=> (dynamic_invariant1 cat true true true true)
     (= (pick_last cat) (to_rep
                        (select (to_array num_item_per_category) cat)))) :pattern (
  (pick_last cat)) )))

(declare-const idx1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const idx2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant2 ((temp___expr_187 us_rep)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=> (= temp___do_toplevel_185 true)
                                     (=> (= temp___is_init_183 true)
                                     (<= (to_rep
                                         (rec__counter_example__item__idx
                                         (us_split_fields1 temp___expr_187))) 
                                     (to_rep
                                     (select (to_array num_item_per_category) 
                                     (to_rep1
                                     (rec__counter_example__item__cat
                                     (us_split_fields1 temp___expr_187)))))))))

(define-fun dynamic_predicate ((temp___193 us_rep)) Bool (<= (to_rep
                                                             (rec__counter_example__item__idx
                                                             (us_split_fields1
                                                             temp___193))) 
  (to_rep
  (select (to_array num_item_per_category) (to_rep1
                                           (rec__counter_example__item__cat
                                           (us_split_fields1 temp___193)))))))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

;; idx1__def_axiom
  (assert
  (and (pick_last__function_guard (pick_last cat1) cat1)
  (= idx1 (pick_last cat1))))

;; idx2__def_axiom
  (assert
  (and (pick_last__function_guard (pick_last cat2) cat2)
  (= idx2 (pick_last cat2))))

(define-fun dynamic_invariant4 ((temp___expr_181 us_t)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (not (= temp___skip_constant_178 true))
                                     (dynamic_property 1 8
                                     (first1 temp___expr_181)
                                     (last1 temp___expr_181))))

(declare-sort t3s 0)

(declare-fun t3sqtint (t3s) Int)

;; t3s'axiom
  (assert (forall ((i t3s)) (and (<= 1 (t3sqtint i)) (<= (t3sqtint i) 8))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (t3s t3s) Bool)

(declare-const dummy5 t3s)

(declare-datatypes ((t3s__ref 0))
(((t3s__refqtmk (t3s__content t3s)))))
(define-fun t3s__ref_t3s__content__projection ((a t3s__ref)) t3s (t3s__content
                                                                 a))

(declare-fun counter_example__num_item_per_category__aggregate_def (Int Int
  Int Int Int Int Int Int) (Array Int natural))

;; num_item_per_category__def_axiom
  (assert
  (= num_item_per_category (of_array
                           (counter_example__num_item_per_category__aggregate_def
                           3 8 10000 42 98 76 0 1) 1 8)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 3))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 8))

(declare-const rliteral2 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral2) 10000))

(declare-const rliteral3 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral3) 42))

(declare-const rliteral4 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral4) 98))

(declare-const rliteral5 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral5) 76))

(declare-const rliteral6 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral6) 0))

(declare-const rliteral7 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral7) 1))

;; def_axiom
  (assert
  (forall ((temp___156 Int) (temp___157 Int) (temp___158 Int)
  (temp___159 Int) (temp___160 Int) (temp___161 Int) (temp___162 Int)
  (temp___163 Int))
  (let ((temp___155 (counter_example__num_item_per_category__aggregate_def
                    temp___156 temp___157 temp___158 temp___159 temp___160
                    temp___161 temp___162 temp___163)))
  (=>
  (and
  (and (dynamic_invariant temp___156 true true true true) (dynamic_invariant
  temp___157 true true true true))
  (and
  (and
  (and (dynamic_invariant temp___158 true true true true) (dynamic_invariant
  temp___159 true true true true)) (dynamic_invariant temp___160 true true
  true true))
  (and
  (and (dynamic_invariant temp___161 true true true true) (dynamic_invariant
  temp___162 true true true true)) (dynamic_invariant temp___163 true true
  true true))))
  (and
  (and (= (select temp___155 1) rliteral)
  (= (select temp___155 2) rliteral1))
  (and
  (and
  (and (= (select temp___155 3) rliteral2)
  (= (select temp___155 4) rliteral3)) (= (select temp___155 5) rliteral4))
  (and
  (and (= (select temp___155 6) rliteral5)
  (= (select temp___155 7) rliteral6)) (= (select temp___155 8) rliteral7))))))))

(assert
;; defqtvc
 ;; File "counter_example.ads", line 14, characters 0-0
  (not
  (=> (dynamic_invariant1 cat1 true false true true)
  (=> (dynamic_invariant1 cat2 true false true true)
  (let ((o cat1))
  (let ((counter_example__get_best_item__idx1__assume (pick_last o)))
  (=>
  (and (pick_last__function_guard
  counter_example__get_best_item__idx1__assume o)
  (and (dynamic_invariant counter_example__get_best_item__idx1__assume true
  false true true)
  (= counter_example__get_best_item__idx1__assume (to_rep
                                                  (select (to_array
                                                          num_item_per_category) o)))))
  (=> (= counter_example__get_best_item__idx1__assume idx1)
  (=> (dynamic_invariant idx1 true false true true)
  (let ((o1 cat2))
  (let ((counter_example__get_best_item__idx2__assume (pick_last o1)))
  (=>
  (and (pick_last__function_guard
  counter_example__get_best_item__idx2__assume o1)
  (and (dynamic_invariant counter_example__get_best_item__idx2__assume true
  false true true)
  (= counter_example__get_best_item__idx2__assume (to_rep
                                                  (select (to_array
                                                          num_item_per_category) o1)))))
  (=> (= counter_example__get_best_item__idx2__assume idx2)
  (=> (dynamic_invariant idx2 true false true true)
  (forall ((pick1 Bool))
  (=> (= pick1 (distinct 0 0))
  (forall ((spark__branch Bool))
  (=> (= spark__branch pick1) (= spark__branch true)))))))))))))))))))
(check-sat)
(exit)
