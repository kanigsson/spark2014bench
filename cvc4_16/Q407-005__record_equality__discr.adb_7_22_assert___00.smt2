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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(define-fun to_rep1 ((x positive)) Int (positiveqtint x))

(declare-fun of_rep1 (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int) integer)

(declare-fun set (map1 Int Int integer) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a integer))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a integer))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_154 Int)
                             (temp___idx_155 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_154)
                             (<= temp___idx_154 a__last))
                             (and (<= a__first_2 temp___idx_155)
                             (<= temp___idx_155 a__last_2)))
                             (= (to_rep
                                (get a temp___idx_154 temp___idx_155)) 
                             (to_rep
                             (get b (+ (- b__first a__first) temp___idx_154)
                             (+ (- b__first_2 a__first_2) temp___idx_155)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_154 Int) (temp___idx_155 Int))
  (=>
  (and (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (and (<= a__first_2 temp___idx_155) (<= temp___idx_155 a__last_2)))
  (= (to_rep (get a temp___idx_154 temp___idx_155)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_154)
                                                    (+ (- b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

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
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-sort t1 0)

(declare-fun first1 (t1) integer)

(declare-fun last1 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first1 (mk1 f l))) f) (= (to_rep (last1 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts map1)(rt t)(rt_2 t1)))))
(define-fun to_array ((a us_t)) map1 (elts a))

(define-fun of_array ((a map1) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t (us_tqtmk a (mk f l) (mk1 f2 l2)))

(define-fun first2 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last2 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first2 a) (last2 a))
                                  (+ (- (last2 a) (first2 a)) 1) 0))

(define-fun first_2 ((a us_t)) Int (to_rep (first1 (rt_2 a))))

(define-fun last_2 ((a us_t)) Int (to_rep (last1 (rt_2 a))))

(define-fun length_2 ((a us_t)) Int (ite (<= (first_2 a) (last_2 a))
                                    (+ (- (last_2 a) (first_2 a)) 1) 0))

(define-fun dynamic_property2 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property range_first1 range_last1 f1 l1)
                 (dynamic_property1 range_first2 range_last2 f2 l2)))

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
                 (to_rep (last (rt x))) (to_rep (first1 (rt_2 x)))
                 (to_rep (last1 (rt_2 x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y))) (to_rep (first1 (rt_2 y)))
                 (to_rep (last1 (rt_2 y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((t_array__ref 0))
(((t_array__refqtmk (t_array__content us_t)))))
(define-fun t_array__ref_t_array__content__projection ((a t_array__ref)) us_t 
  (t_array__content a))

(declare-datatypes ((t3s__ref 0))
(((t3s__refqtmk (t3s__content us_t)))))
(define-fun t3s__ref_t3s__content__projection ((a t3s__ref)) us_t (t3s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__discr__t_record__row_first positive)(rec__discr__t_record__row_last positive)(rec__discr__t_record__col_first positive)(rec__discr__t_record__col_last positive)))))
(define-fun us_split_discrs_rec__discr__t_record__row_first__projection ((a us_split_discrs)) positive 
  (rec__discr__t_record__row_first a))

(define-fun us_split_discrs_rec__discr__t_record__row_last__projection ((a us_split_discrs)) positive 
  (rec__discr__t_record__row_last a))

(define-fun us_split_discrs_rec__discr__t_record__col_first__projection ((a us_split_discrs)) positive 
  (rec__discr__t_record__col_first a))

(define-fun us_split_discrs_rec__discr__t_record__col_last__projection ((a us_split_discrs)) positive 
  (rec__discr__t_record__col_last a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__discr__t_record__data us_t)))))
(define-fun us_split_fields_rec__discr__t_record__data__projection ((a us_split_fields)) us_t 
  (rec__discr__t_record__data a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (and
                        (and
                        (= (to_rep1
                           (rec__discr__t_record__row_first
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__discr__t_record__row_first
                                                  (us_split_discrs1 b))))
                        (= (to_rep1
                           (rec__discr__t_record__row_last
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__discr__t_record__row_last
                                                  (us_split_discrs1 b)))))
                        (= (to_rep1
                           (rec__discr__t_record__col_first
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__discr__t_record__col_first
                                                  (us_split_discrs1 b)))))
                        (= (to_rep1
                           (rec__discr__t_record__col_last
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__discr__t_record__col_last
                                                  (us_split_discrs1 b)))))
                        (= (bool_eq1
                           (rec__discr__t_record__data (us_split_fields1 a))
                           (rec__discr__t_record__data (us_split_fields1 b))) true))
                   true false))

(define-fun in_range2 ((rec__discr__t_record__row_first1 Int)
  (rec__discr__t_record__row_last1 Int)
  (rec__discr__t_record__col_first1 Int)
  (rec__discr__t_record__col_last1 Int)
  (a us_split_discrs)) Bool (and
                            (and
                            (and
                            (= rec__discr__t_record__row_first1 (to_rep1
                                                                (rec__discr__t_record__row_first
                                                                a)))
                            (= rec__discr__t_record__row_last1 (to_rep1
                                                               (rec__discr__t_record__row_last
                                                               a))))
                            (= rec__discr__t_record__col_first1 (to_rep1
                                                                (rec__discr__t_record__col_first
                                                                a))))
                            (= rec__discr__t_record__col_last1 (to_rep1
                                                               (rec__discr__t_record__col_last
                                                               a)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const discr__t_record__row_first__first__bit Int)

(declare-const discr__t_record__row_first__last__bit Int)

(declare-const discr__t_record__row_first__position Int)

;; discr__t_record__row_first__first__bit_axiom
  (assert (<= 0 discr__t_record__row_first__first__bit))

;; discr__t_record__row_first__last__bit_axiom
  (assert
  (< discr__t_record__row_first__first__bit discr__t_record__row_first__last__bit))

;; discr__t_record__row_first__position_axiom
  (assert (<= 0 discr__t_record__row_first__position))

(declare-const discr__t_record__row_last__first__bit Int)

(declare-const discr__t_record__row_last__last__bit Int)

(declare-const discr__t_record__row_last__position Int)

;; discr__t_record__row_last__first__bit_axiom
  (assert (<= 0 discr__t_record__row_last__first__bit))

;; discr__t_record__row_last__last__bit_axiom
  (assert
  (< discr__t_record__row_last__first__bit discr__t_record__row_last__last__bit))

;; discr__t_record__row_last__position_axiom
  (assert (<= 0 discr__t_record__row_last__position))

(declare-const discr__t_record__col_first__first__bit Int)

(declare-const discr__t_record__col_first__last__bit Int)

(declare-const discr__t_record__col_first__position Int)

;; discr__t_record__col_first__first__bit_axiom
  (assert (<= 0 discr__t_record__col_first__first__bit))

;; discr__t_record__col_first__last__bit_axiom
  (assert
  (< discr__t_record__col_first__first__bit discr__t_record__col_first__last__bit))

;; discr__t_record__col_first__position_axiom
  (assert (<= 0 discr__t_record__col_first__position))

(declare-const discr__t_record__col_last__first__bit Int)

(declare-const discr__t_record__col_last__last__bit Int)

(declare-const discr__t_record__col_last__position Int)

;; discr__t_record__col_last__first__bit_axiom
  (assert (<= 0 discr__t_record__col_last__first__bit))

;; discr__t_record__col_last__last__bit_axiom
  (assert
  (< discr__t_record__col_last__first__bit discr__t_record__col_last__last__bit))

;; discr__t_record__col_last__position_axiom
  (assert (<= 0 discr__t_record__col_last__position))

(declare-const discr__t_record__data__first__bit Int)

(declare-const discr__t_record__data__last__bit Int)

(declare-const discr__t_record__data__position Int)

;; discr__t_record__data__first__bit_axiom
  (assert (<= 0 discr__t_record__data__first__bit))

;; discr__t_record__data__last__bit_axiom
  (assert
  (< discr__t_record__data__first__bit discr__t_record__data__last__bit))

;; discr__t_record__data__position_axiom
  (assert (<= 0 discr__t_record__data__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t_record__ref 0))
(((t_record__refqtmk (t_record__content us_rep)))))
(define-fun t_record__ref_t_record__content__projection ((a t_record__ref)) us_rep 
  (t_record__content a))

(declare-const rec__ us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const data_copy__first integer)

(declare-const data_copy__last integer)

(declare-const data_copy__first_2 integer)

(declare-const data_copy__last_2 integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_169 us_rep)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (let ((temp___173 (rec__discr__t_record__col_last
                                                       (us_split_discrs1
                                                       temp___expr_169))))
                                     (let ((temp___172 (rec__discr__t_record__col_first
                                                       (us_split_discrs1
                                                       temp___expr_169))))
                                     (let ((temp___171 (rec__discr__t_record__row_last
                                                       (us_split_discrs1
                                                       temp___expr_169))))
                                     (let ((temp___170 (rec__discr__t_record__row_first
                                                       (us_split_discrs1
                                                       temp___expr_169))))
                                     (and
                                     (and (dynamic_property2
                                     (to_rep1 temp___170)
                                     (to_rep1 temp___171)
                                     (first2
                                     (rec__discr__t_record__data
                                     (us_split_fields1 temp___expr_169)))
                                     (last2
                                     (rec__discr__t_record__data
                                     (us_split_fields1 temp___expr_169)))
                                     (to_rep1 temp___172)
                                     (to_rep1 temp___173)
                                     (first_2
                                     (rec__discr__t_record__data
                                     (us_split_fields1 temp___expr_169)))
                                     (last_2
                                     (rec__discr__t_record__data
                                     (us_split_fields1 temp___expr_169))))
                                     (and
                                     (= (first2
                                        (rec__discr__t_record__data
                                        (us_split_fields1 temp___expr_169))) 
                                     (to_rep1 temp___170))
                                     (= (last2
                                        (rec__discr__t_record__data
                                        (us_split_fields1 temp___expr_169))) 
                                     (to_rep1 temp___171))))
                                     (and
                                     (= (first_2
                                        (rec__discr__t_record__data
                                        (us_split_fields1 temp___expr_169))) 
                                     (to_rep1 temp___172))
                                     (= (last_2
                                        (rec__discr__t_record__data
                                        (us_split_fields1 temp___expr_169))) 
                                     (to_rep1 temp___173)))))))))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_162 us_t)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (not (= temp___skip_constant_159 true))
                                     (dynamic_property2 1 2147483647
                                     (first2 temp___expr_162)
                                     (last2 temp___expr_162) 1 2147483647
                                     (first_2 temp___expr_162)
                                     (last_2 temp___expr_162))))

(assert
;; defqtvc
 ;; File "discr.ads", line 15, characters 0-0
  (not
  (=> (dynamic_invariant rec__ true false true true)
  (let ((temp___232 (rec__discr__t_record__data (us_split_fields1 rec__))))
  (let ((discr__test__data_copy__assume (of_array (to_array temp___232)
                                        (first2 temp___232)
                                        (last2 temp___232)
                                        (first_2 temp___232)
                                        (last_2 temp___232))))
  (forall ((data_copy map1))
  (=> (= data_copy (to_array discr__test__data_copy__assume))
  (=> (= (to_rep data_copy__first) (first2 discr__test__data_copy__assume))
  (=> (= (to_rep data_copy__last) (last2 discr__test__data_copy__assume))
  (=>
  (= (to_rep data_copy__first_2) (first_2 discr__test__data_copy__assume))
  (=> (= (to_rep data_copy__last_2) (last_2 discr__test__data_copy__assume))
  (=> (dynamic_property2 1 2147483647 (to_rep data_copy__first)
  (to_rep data_copy__last) 1 2147483647 (to_rep data_copy__first_2)
  (to_rep data_copy__last_2))
  (= (let ((temp___240 (rec__discr__t_record__data (us_split_fields1 rec__))))
     (bool_eq data_copy (to_rep data_copy__first) (to_rep data_copy__last)
     (to_rep data_copy__first_2) (to_rep data_copy__last_2)
     (to_array temp___240) (first2 temp___240) (last2 temp___240)
     (first_2 temp___240) (last_2 temp___240))) true)))))))))))))
(check-sat)
(exit)
