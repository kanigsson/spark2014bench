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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__frame_condition__cell__value natural)(rec__frame_condition__cell__max_left natural)(rec__frame_condition__cell__max_right natural)))))
(define-fun us_split_fields_rec__frame_condition__cell__value__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__value a))

(define-fun us_split_fields_rec__frame_condition__cell__max_left__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__max_left a))

(define-fun us_split_fields_rec__frame_condition__cell__max_right__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__max_right a))

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
                        (and
                        (= (to_rep
                           (rec__frame_condition__cell__value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__frame_condition__cell__value
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__frame_condition__cell__max_left
                           (us_split_fields1 a))) (to_rep
                                                  (rec__frame_condition__cell__max_left
                                                  (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__frame_condition__cell__max_right
                           (us_split_fields1 a))) (to_rep
                                                  (rec__frame_condition__cell__max_right
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

(declare-const frame_condition__cell__value__first__bit Int)

(declare-const frame_condition__cell__value__last__bit Int)

(declare-const frame_condition__cell__value__position Int)

;; frame_condition__cell__value__first__bit_axiom
  (assert (<= 0 frame_condition__cell__value__first__bit))

;; frame_condition__cell__value__last__bit_axiom
  (assert
  (< frame_condition__cell__value__first__bit frame_condition__cell__value__last__bit))

;; frame_condition__cell__value__position_axiom
  (assert (<= 0 frame_condition__cell__value__position))

(declare-const frame_condition__cell__max_left__first__bit Int)

(declare-const frame_condition__cell__max_left__last__bit Int)

(declare-const frame_condition__cell__max_left__position Int)

;; frame_condition__cell__max_left__first__bit_axiom
  (assert (<= 0 frame_condition__cell__max_left__first__bit))

;; frame_condition__cell__max_left__last__bit_axiom
  (assert
  (< frame_condition__cell__max_left__first__bit frame_condition__cell__max_left__last__bit))

;; frame_condition__cell__max_left__position_axiom
  (assert (<= 0 frame_condition__cell__max_left__position))

(declare-const frame_condition__cell__max_right__first__bit Int)

(declare-const frame_condition__cell__max_right__last__bit Int)

(declare-const frame_condition__cell__max_right__position Int)

;; frame_condition__cell__max_right__first__bit_axiom
  (assert (<= 0 frame_condition__cell__max_right__first__bit))

;; frame_condition__cell__max_right__last__bit_axiom
  (assert
  (< frame_condition__cell__max_right__first__bit frame_condition__cell__max_right__last__bit))

;; frame_condition__cell__max_right__position_axiom
  (assert (<= 0 frame_condition__cell__max_right__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((cell__ref 0))
(((cell__refqtmk (cell__content us_rep)))))
(define-fun cell__ref_cell__content__projection ((a cell__ref)) us_rep 
  (cell__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
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

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((cell_array__ref 0))
(((cell_array__refqtmk (cell_array__content us_t)))))
(define-fun cell_array__ref_cell_array__content__projection ((a cell_array__ref)) us_t 
  (cell_array__content a))

(declare-const c164b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const not_kind Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const first2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const last2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const c166b Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const c198b Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const c201b Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const not_kind1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const first3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const last3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-const c203b Int)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-const c235b Int)

(declare-const attr__ATTRIBUTE_ADDRESS20 Int)

(declare-sort max_kind 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (max_kind max_kind) Bool)

(declare-const dummy5 max_kind)

(declare-datatypes ((max_kind__ref 0))
(((max_kind__refqtmk (max_kind__content max_kind)))))
(define-fun max_kind__ref_max_kind__content__projection ((a max_kind__ref)) max_kind 
  (max_kind__content a))

(define-fun dynamic_invariant2 ((temp___expr_258 Int)
  (temp___is_init_254 Bool) (temp___skip_constant_255 Bool)
  (temp___do_toplevel_256 Bool)
  (temp___do_typ_inv_257 Bool)) Bool (=>
                                     (or (= temp___is_init_254 true)
                                     (<= 0 1)) (in_range4 temp___expr_258)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_173 us_t)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (not (= temp___skip_constant_170 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_173)
                                     (last1 temp___expr_173))))

;; not_kind__def_axiom
  (assert (= not_kind 1))

;; first__def_axiom
  (assert (= first2 (ite true (to_rep1 a__first) (to_rep1 a__last))))

;; last__def_axiom
  (assert (= last2 (ite true (to_rep1 a__last) (to_rep1 a__first))))

;; c164b__def_axiom
  (assert (= c164b 0))

;; c166b__def_axiom
  (assert (= c166b 0))

;; c198b__def_axiom
  (assert (= c198b 0))

;; not_kind__def_axiom
  (assert (= not_kind1 0))

;; first__def_axiom
  (assert (= first3 (ite (= 1 0) (to_rep1 a__first) (to_rep1 a__last))))

;; last__def_axiom
  (assert (= last3 (ite (= 1 0) (to_rep1 a__last) (to_rep1 a__first))))

;; c201b__def_axiom
  (assert (= c201b 1))

;; c203b__def_axiom
  (assert (= c203b 1))

;; c235b__def_axiom
  (assert (= c235b 1))

(assert
;; defqtvc
 ;; File "frame_condition.ads", line 24, characters 0-0
  (not
  (forall ((a (Array Int us_rep)) (o Int) (o1 Int) (spark__branch Bool)
  (spark__branch1 Bool) (a1 (Array Int us_rep))
  (frame_condition__update_max_3__B202b__first__assume Int)
  (frame_condition__update_max_3__B202b__last__assume Int) (k Int) (max Int))
  (=> (dynamic_property 1 2147483647 (to_rep1 a__first) (to_rep1 a__last))
  (=> (= (to_rep1 a__last) o)
  (=> (= (to_rep1 a__first) o1)
  (=> (= spark__branch (ite (= (length o1 o) 0) true false))
  (=> (not (= spark__branch true))
  (=> (dynamic_invariant2 c164b true false true true)
  (=> (dynamic_invariant2 not_kind true false true true)
  (=>
  (exists ((frame_condition__update_max_3__B165b__first__assume Int))
  (and
  (exists ((o2 Int))
  (and (= (to_rep1 a__first) o2)
  (and (= frame_condition__update_max_3__B165b__first__assume o2) (in_range3
  o2))))
  (and (= frame_condition__update_max_3__B165b__first__assume first2)
  (and (dynamic_invariant1 first2 true false true true)
  (exists ((frame_condition__update_max_3__B165b__last__assume Int))
  (and
  (exists ((o2 Int))
  (and (= (to_rep1 a__last) o2)
  (and (= frame_condition__update_max_3__B165b__last__assume o2) (in_range3
  o2))))
  (and (= frame_condition__update_max_3__B165b__last__assume last2)
  (and (dynamic_invariant1 last2 true false true true)
  (exists ((k1 Int))
  (and (= k1 first2)
  (and (dynamic_invariant1 k1 true false true true)
  (exists ((max1 Int))
  (and (= max1 0)
  (and (dynamic_invariant max1 true false true true)
  (exists ((temp___loop_entry_300 (Array Int us_rep)))
  (and (= temp___loop_entry_300 a)
  (exists ((spark__branch2 Bool) (max2 Int))
  (and
  (and (and (<= (to_rep1 a__first) k1) (<= k1 (to_rep1 a__last)))
  (exists ((o2 Int))
  (and
  (= (to_rep
     (rec__frame_condition__cell__value (us_split_fields1 (select a k1)))) o2)
  (and (= spark__branch2 (ite (< max1 o2) true false))
  (ite (= spark__branch2 true)
  (and (and (<= (to_rep1 a__first) k1) (<= k1 (to_rep1 a__last)))
  (exists ((o3 Int))
  (and
  (= (to_rep
     (rec__frame_condition__cell__value (us_split_fields1 (select a k1)))) o3)
  (= max2 o3)))) (= max2 max1))))))
  (and (dynamic_invariant2 c166b true false true true)
  (exists ((c167b Int))
  (and (= c167b k1)
  (and (dynamic_invariant1 c167b true false true true)
  (exists ((c168b Int))
  (and (= c168b max2)
  (and (dynamic_invariant c168b true false true true)
  (exists ((spark__branch3 Bool) (a2 (Array Int us_rep)))
  (and
  (and (= spark__branch3 (ite true true false))
  (ite (= spark__branch3 true)
  (let ((q_ (us_split_fields1 (select a c167b))))
  (exists ((o2 natural))
  (and (= (to_rep o2) c168b)
  (and (and (<= (to_rep1 a__first) c167b) (<= c167b (to_rep1 a__last)))
  (= a2 (store a c167b (us_repqtmk
                       (us_split_fieldsqtmk
                       (rec__frame_condition__cell__value q_) o2
                       (rec__frame_condition__cell__max_right q_)))))))))
  (let ((q_ (us_split_fields1 (select a c167b))))
  (exists ((o2 natural))
  (and (= (to_rep o2) c168b)
  (and (and (<= (to_rep1 a__first) c167b) (<= c167b (to_rep1 a__last)))
  (= a2 (store a c167b (us_repqtmk
                       (us_split_fieldsqtmk
                       (rec__frame_condition__cell__value q_)
                       (rec__frame_condition__cell__max_left q_) o2))))))))))
  (exists ((o2 Int))
  (and (= (to_rep1 a__last) o2)
  (exists ((o3 Int))
  (and (= (to_rep1 a__first) o3)
  (exists ((spark__branch4 Bool) (k2 Int) (max3 Int) (c167b1 Int)
  (c168b1 Int))
  (and
  (and (and (<= (to_rep1 a__first) k2) (<= k2 (to_rep1 a__last)))
  (and
  (and
  (forall ((i Int))
  (=> (and (<= first2 i) (<= i k2))
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a1 i)))) max3)))
  (forall ((i Int))
  (=> (and (<= k2 i) (<= i first2))
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a1 i)))) max3))))
  (forall ((i Int))
  (=> (and (<= (to_rep1 a__first) i) (<= i k2))
  (forall ((j Int))
  (=> (and (<= i j) (<= j k2))
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a1 i)))) 
  (to_rep
  (rec__frame_condition__cell__max_left (us_split_fields1 (select a1 j)))))))))))
  (and
  (and
  (and
  (and
  (and (dynamic_invariant max3 true true true true)
  (forall ((temp___295 Int))
  (=>
  (and (<= (to_rep1 a__first) temp___295) (<= temp___295 (to_rep1 a__last)))
  (= (rec__frame_condition__cell__value
     (us_split_fields1 (select a1 temp___295))) (rec__frame_condition__cell__value
                                                (us_split_fields1
                                                (select a temp___295)))))))
  (dynamic_invariant1 c167b1 true true true true)) (dynamic_invariant1 k2
  true true true true)) (dynamic_invariant c168b1 true true true true))
  (and (= k2 last2) (= spark__branch1 spark__branch4))))))))))))))))))))))))))))))))))))
  (=> (dynamic_invariant2 c201b true false true true)
  (=> (dynamic_invariant2 not_kind1 true false true true)
  (=>
  (ite (= 1 0)
  (exists ((o2 Int))
  (and (= (to_rep1 a__first) o2)
  (and (= frame_condition__update_max_3__B202b__first__assume o2) (in_range3
  o2))))
  (exists ((o2 Int))
  (and (= (to_rep1 a__last) o2)
  (and (= frame_condition__update_max_3__B202b__first__assume o2) (in_range3
  o2)))))
  (=> (= frame_condition__update_max_3__B202b__first__assume first3)
  (=> (dynamic_invariant1 first3 true false true true)
  (=>
  (ite (= 1 0)
  (exists ((o2 Int))
  (and (= (to_rep1 a__last) o2)
  (and (= frame_condition__update_max_3__B202b__last__assume o2) (in_range3
  o2))))
  (exists ((o2 Int))
  (and (= (to_rep1 a__first) o2)
  (and (= frame_condition__update_max_3__B202b__last__assume o2) (in_range3
  o2)))))
  (=> (= frame_condition__update_max_3__B202b__last__assume last3)
  (=> (dynamic_invariant1 last3 true false true true)
  (=> (= k first3)
  (=> (dynamic_invariant1 k true false true true)
  (=> (= max 0)
  (=> (dynamic_invariant max true false true true) (<= (to_rep1 a__first) k))))))))))))))))))))))))
(check-sat)
(exit)
