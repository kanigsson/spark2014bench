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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const value Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__list__t_item__used Bool)))))
(define-fun us_split_discrs_rec__list__t_item__used__projection ((a us_split_discrs)) Bool 
  (rec__list__t_item__used a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields (us_split_fieldsqtmk (rec__list__t_item__value integer)))))
(define-fun us_split_fields_rec__list__t_item__value__projection ((a us_split_fields)) integer 
  (rec__list__t_item__value a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun list__t_item__value__pred ((a us_rep)) Bool (= (ite (rec__list__t_item__used
                                                                (us_split_discrs1
                                                                a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__list__t_item__used
                                (us_split_discrs1 a)) 1 0) (ite (rec__list__t_item__used
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=> (list__t_item__value__pred a)
                        (= (to_rep
                           (rec__list__t_item__value (us_split_fields1 a))) 
                        (to_rep
                        (rec__list__t_item__value (us_split_fields1 b))))))
                   true false))

(define-fun in_range2 ((rec__list__t_item__used1 Bool)
  (a us_split_discrs)) Bool (= rec__list__t_item__used1 (rec__list__t_item__used
                                                        a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const list__t_item__used__first__bit Int)

(declare-const list__t_item__used__last__bit Int)

(declare-const list__t_item__used__position Int)

;; list__t_item__used__first__bit_axiom
  (assert (<= 0 list__t_item__used__first__bit))

;; list__t_item__used__last__bit_axiom
  (assert (< list__t_item__used__first__bit list__t_item__used__last__bit))

;; list__t_item__used__position_axiom
  (assert (<= 0 list__t_item__used__position))

(declare-const list__t_item__value__first__bit Int)

(declare-const list__t_item__value__last__bit Int)

(declare-const list__t_item__value__position Int)

;; list__t_item__value__first__bit_axiom
  (assert (<= 0 list__t_item__value__first__bit))

;; list__t_item__value__last__bit_axiom
  (assert (< list__t_item__value__first__bit list__t_item__value__last__bit))

;; list__t_item__value__position_axiom
  (assert (<= 0 list__t_item__value__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((t_item__ref (t_item__refqtmk (t_item__content us_rep)))))
(define-fun t_item__ref_t_item__content__projection ((a t_item__ref)) us_rep 
  (t_item__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort tt_itemsD1 0)

(declare-fun tt_itemsD1qtint (tt_itemsD1) Int)

;; tt_itemsD1'axiom
  (assert
  (forall ((i tt_itemsD1))
  (and (<= 1 (tt_itemsD1qtint i)) (<= (tt_itemsD1qtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tt_itemsD1 tt_itemsD1) Bool)

(declare-const dummy2 tt_itemsD1)

(declare-datatypes ()
((tt_itemsD1__ref (tt_itemsD1__refqtmk (tt_itemsD1__content tt_itemsD1)))))
(define-fun tt_itemsD1__ref_tt_itemsD1__content__projection ((a tt_itemsD1__ref)) tt_itemsD1 
  (tt_itemsD1__content a))

(define-fun default_initial_assumption ((temp___expr_176 (Array Int us_rep))
  (temp___skip_top_level_177 Bool)) Bool (forall ((temp___178 Int))
                                         (=>
                                         (and (<= 1 temp___178)
                                         (<= temp___178 100))
                                         (= (rec__list__t_item__used
                                            (us_split_discrs1
                                            (select temp___expr_176 temp___178))) (distinct 0 0)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const list__t_item__used__first__bit1 Int)

(declare-const list__t_item__used__last__bit1 Int)

(declare-const list__t_item__used__position1 Int)

;; list__t_item__used__first__bit_axiom
  (assert (<= 0 list__t_item__used__first__bit1))

;; list__t_item__used__last__bit_axiom
  (assert (< list__t_item__used__first__bit1 list__t_item__used__last__bit1))

;; list__t_item__used__position_axiom
  (assert (<= 0 list__t_item__used__position1))

(declare-const list__t_item__value__first__bit1 Int)

(declare-const list__t_item__value__last__bit1 Int)

(declare-const list__t_item__value__position1 Int)

;; list__t_item__value__first__bit_axiom
  (assert (<= 0 list__t_item__value__first__bit1))

;; list__t_item__value__last__bit_axiom
  (assert
  (< list__t_item__value__first__bit1 list__t_item__value__last__bit1))

;; list__t_item__value__position_axiom
  (assert (<= 0 list__t_item__value__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((t7b__ref (t7b__refqtmk (t7b__content us_rep)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_rep (t7b__content
                                                                    a))

(define-fun default_initial_assumption1 ((temp___expr_165 us_rep)
  (temp___skip_top_level_166 Bool)) Bool (= (rec__list__t_item__used
                                            (us_split_discrs1
                                            temp___expr_165)) (distinct 0 0)))

(declare-const items (Array Int us_rep))

(declare-const used_items Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant used_items true false true true))

;; Assume
  (assert (dynamic_invariant value true false true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= used_items 100) true false)))

;; H
  (assert (not (= spark__branch true)))

(declare-const i Int)

;; H
  (assert (= i 1))

;; H
  (assert
  (= (and (ite (<= 1 i) true false) (ite (<= i 100) true false)) true))

(declare-const i1 Int)

;; H
  (assert
  (= (and (ite true true false) (ite (and (<= 1 i1) (<= i1 100)) true false)) true))

(declare-const spark__branch1 Bool)

;; H
  (assert
  (= spark__branch1 (ite (= (rec__list__t_item__used
                            (us_split_discrs1 (select items i1))) true)
                    false true)))

;; H
  (assert (= spark__branch1 true))

(declare-const o integer)

;; Ensures
  (assert (= (to_rep o) value))

;; H
  (assert false)

(assert
;; defqtvc
 ;; File "list.ads", line 7, characters 0-0
  (not
  (= (distinct 1 0) (rec__list__t_item__used
                    (us_split_discrs1 (select items i1))))))
(check-sat)

(exit)
