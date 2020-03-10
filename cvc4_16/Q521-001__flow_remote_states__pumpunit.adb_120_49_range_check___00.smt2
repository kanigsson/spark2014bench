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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun get_outstanding (Int) Int)

(declare-fun get_outstanding__function_guard (Int Int) Bool)

;; get_outstanding__post_axiom
  (assert
  (forall ((pumpunit__outstanding Int))
  (! (=> (dynamic_invariant pumpunit__outstanding true true true true)
     (let ((result (get_outstanding pumpunit__outstanding)))
     (=> (get_outstanding__function_guard result pumpunit__outstanding)
     (dynamic_invariant result true false true true)))) :pattern ((get_outstanding
                                                                  pumpunit__outstanding)) )))

;; get_outstanding__def_axiom
  (assert
  (forall ((pumpunit__outstanding Int))
  (! (=> (dynamic_invariant pumpunit__outstanding true true true true)
     (= (get_outstanding pumpunit__outstanding) pumpunit__outstanding)) :pattern (
  (get_outstanding pumpunit__outstanding)) )))

(declare-const dummy5 (Array Int character))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq5 ((Array Int character) (Array Int character)) Bool)

(declare-sort nat_type 0)

(declare-fun nat_typeqtint (nat_type) Int)

;; nat_type'axiom
  (assert
  (forall ((i nat_type))
  (and (<= 0 (nat_typeqtint i)) (<= (nat_typeqtint i) 1000))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (nat_type nat_type) Bool)

(declare-const dummy6 nat_type)

(declare-datatypes ((nat_type__ref 0))
(((nat_type__refqtmk (nat_type__content nat_type)))))
(define-fun nat_type__ref_nat_type__content__projection ((a nat_type__ref)) nat_type 
  (nat_type__content a))

(define-fun to_rep2 ((x nat_type)) Int (nat_typeqtint x))

(declare-fun of_rep2 (Int) nat_type)

;; inversion_axiom
  (assert
  (forall ((x nat_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x nat_type)) (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__pump__pump_record__name (Array Int character))(rec__pump__pump_record__resevoir nat_type)(rec__pump__pump_record__price nat_type)(rec__pump__pump_record__remaining nat_type)))))
(define-fun us_split_fields_rec__pump__pump_record__name__projection ((a us_split_fields)) (Array Int character) 
  (rec__pump__pump_record__name a))

(define-fun us_split_fields_rec__pump__pump_record__resevoir__projection ((a us_split_fields)) nat_type 
  (rec__pump__pump_record__resevoir a))

(define-fun us_split_fields_rec__pump__pump_record__price__projection ((a us_split_fields)) nat_type 
  (rec__pump__pump_record__price a))

(define-fun us_split_fields_rec__pump__pump_record__remaining__projection ((a us_split_fields)) nat_type 
  (rec__pump__pump_record__remaining a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (bool_eq
                           (rec__pump__pump_record__name
                           (us_split_fields1 a)) 1 10
                           (rec__pump__pump_record__name
                           (us_split_fields1 b)) 1 10) true)
                        (= (to_rep2
                           (rec__pump__pump_record__resevoir
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__pump__pump_record__resevoir
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep2
                           (rec__pump__pump_record__price
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__pump__pump_record__price
                                                  (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__pump__pump_record__remaining
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__pump__pump_record__remaining
                                                  (us_split_fields1 b))))))
                   true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const pump__pump_record__name__first__bit Int)

(declare-const pump__pump_record__name__last__bit Int)

(declare-const pump__pump_record__name__position Int)

;; pump__pump_record__name__first__bit_axiom
  (assert (<= 0 pump__pump_record__name__first__bit))

;; pump__pump_record__name__last__bit_axiom
  (assert
  (< pump__pump_record__name__first__bit pump__pump_record__name__last__bit))

;; pump__pump_record__name__position_axiom
  (assert (<= 0 pump__pump_record__name__position))

(declare-const pump__pump_record__resevoir__first__bit Int)

(declare-const pump__pump_record__resevoir__last__bit Int)

(declare-const pump__pump_record__resevoir__position Int)

;; pump__pump_record__resevoir__first__bit_axiom
  (assert (<= 0 pump__pump_record__resevoir__first__bit))

;; pump__pump_record__resevoir__last__bit_axiom
  (assert
  (< pump__pump_record__resevoir__first__bit pump__pump_record__resevoir__last__bit))

;; pump__pump_record__resevoir__position_axiom
  (assert (<= 0 pump__pump_record__resevoir__position))

(declare-const pump__pump_record__price__first__bit Int)

(declare-const pump__pump_record__price__last__bit Int)

(declare-const pump__pump_record__price__position Int)

;; pump__pump_record__price__first__bit_axiom
  (assert (<= 0 pump__pump_record__price__first__bit))

;; pump__pump_record__price__last__bit_axiom
  (assert
  (< pump__pump_record__price__first__bit pump__pump_record__price__last__bit))

;; pump__pump_record__price__position_axiom
  (assert (<= 0 pump__pump_record__price__position))

(declare-const pump__pump_record__remaining__first__bit Int)

(declare-const pump__pump_record__remaining__last__bit Int)

(declare-const pump__pump_record__remaining__position Int)

;; pump__pump_record__remaining__first__bit_axiom
  (assert (<= 0 pump__pump_record__remaining__first__bit))

;; pump__pump_record__remaining__last__bit_axiom
  (assert
  (< pump__pump_record__remaining__first__bit pump__pump_record__remaining__last__bit))

;; pump__pump_record__remaining__position_axiom
  (assert (<= 0 pump__pump_record__remaining__position))

(declare-fun user_eq7 (us_rep us_rep) Bool)

(declare-const dummy7 us_rep)

(declare-datatypes ((pump_record__ref 0))
(((pump_record__refqtmk (pump_record__content us_rep)))))
(define-fun pump_record__ref_pump_record__content__projection ((a pump_record__ref)) us_rep 
  (pump_record__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun get_cur_price (us_split_fields) Int)

(declare-fun get_cur_price__function_guard (Int us_split_fields) Bool)

(define-fun dynamic_invariant1 ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 1000)) (in_range4
                                     temp___expr_178)))

;; get_cur_price__post_axiom
  (assert
  (forall ((pumpunit__cur_pump__fields us_split_fields))
  (! (let ((result (get_cur_price pumpunit__cur_pump__fields)))
     (=> (get_cur_price__function_guard result pumpunit__cur_pump__fields)
     (dynamic_invariant1 result true false true true))) :pattern ((get_cur_price
                                                                  pumpunit__cur_pump__fields)) )))

;; get_cur_price__def_axiom
  (assert
  (forall ((pumpunit__cur_pump__fields us_split_fields))
  (! (= (get_cur_price pumpunit__cur_pump__fields) (to_rep2
                                                   (rec__pump__pump_record__price
                                                   (us_split_fields1
                                                   (us_repqtmk
                                                   pumpunit__cur_pump__fields))))) :pattern (
  (get_cur_price pumpunit__cur_pump__fields)) )))

(declare-fun get_cur_resevoir (us_split_fields) Int)

(declare-fun get_cur_resevoir__function_guard (Int us_split_fields) Bool)

;; get_cur_resevoir__post_axiom
  (assert
  (forall ((pumpunit__cur_pump__fields us_split_fields))
  (! (let ((result (get_cur_resevoir pumpunit__cur_pump__fields)))
     (=> (get_cur_resevoir__function_guard result pumpunit__cur_pump__fields)
     (dynamic_invariant1 result true false true true))) :pattern ((get_cur_resevoir
                                                                  pumpunit__cur_pump__fields)) )))

;; get_cur_resevoir__def_axiom
  (assert
  (forall ((pumpunit__cur_pump__fields us_split_fields))
  (! (= (get_cur_resevoir pumpunit__cur_pump__fields) (to_rep2
                                                      (rec__pump__pump_record__resevoir
                                                      (us_split_fields1
                                                      (us_repqtmk
                                                      pumpunit__cur_pump__fields))))) :pattern (
  (get_cur_resevoir pumpunit__cur_pump__fields)) )))

(declare-fun is_ready (Int) Bool)

(declare-fun is_ready__function_guard (Bool Int) Bool)

(declare-sort internal_state 0)

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (internal_state internal_state) Bool)

(declare-const dummy8 internal_state)

(declare-datatypes ((internal_state__ref 0))
(((internal_state__refqtmk (internal_state__content internal_state)))))
(define-fun internal_state__ref_internal_state__content__projection ((a internal_state__ref)) internal_state 
  (internal_state__content a))

(define-fun dynamic_invariant2 ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= 0 3)) (in_range5 temp___expr_171)))

;; is_ready__post_axiom
  (assert true)

;; is_ready__def_axiom
  (assert
  (forall ((pumpunit__cur_state Int))
  (! (= (= (is_ready pumpunit__cur_state) true) (= pumpunit__cur_state 1)) :pattern (
  (is_ready pumpunit__cur_state)) )))

(declare-fun is_pumping (Int) Bool)

(declare-fun is_pumping__function_guard (Bool Int) Bool)

;; is_pumping__post_axiom
  (assert true)

;; is_pumping__def_axiom
  (assert
  (forall ((pumpunit__cur_state Int))
  (! (= (= (is_pumping pumpunit__cur_state) true) (= pumpunit__cur_state 0)) :pattern (
  (is_pumping pumpunit__cur_state)) )))

(declare-sort t1s 0)

(declare-fun t1sqtint (t1s) Int)

;; t1s'axiom
  (assert (forall ((i t1s)) (and (<= 1 (t1sqtint i)) (<= (t1sqtint i) 10))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (t1s t1s) Bool)

(declare-const dummy9 t1s)

(declare-datatypes ((t1s__ref 0))
(((t1s__refqtmk (t1s__content t1s)))))
(define-fun t1s__ref_t1s__content__projection ((a t1s__ref)) t1s (t1s__content
                                                                 a))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant5 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant6 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "pumpunit.ads", line 54, characters 0-0
  (not
  (forall ((cur_state Int) (outstanding Int)
  (cur_pump__split_fields us_split_fields))
  (=> (dynamic_invariant2 cur_state true false true true)
  (=> (dynamic_invariant outstanding true false true true)
  (=>
  (forall ((cur_state1 Int)) (is_ready__function_guard (is_ready cur_state1)
  cur_state1))
  (=> (= (is_ready cur_state) true)
  (=>
  (forall ((outstanding1 Int)) (get_outstanding__function_guard
  (get_outstanding outstanding1) outstanding1))
  (=>
  (forall ((cur_pump__split_fields1 us_split_fields))
  (get_cur_price__function_guard (get_cur_price cur_pump__split_fields1)
  cur_pump__split_fields1))
  (=>
  (< (get_outstanding outstanding) (- 2147483647 (get_cur_price
                                                 cur_pump__split_fields)))
  (=>
  (forall ((cur_pump__split_fields1 us_split_fields))
  (get_cur_resevoir__function_guard
  (get_cur_resevoir cur_pump__split_fields1) cur_pump__split_fields1))
  (=> (< 0 (get_cur_resevoir cur_pump__split_fields))
  (=>
  (forall ((outstanding1 Int)) (get_outstanding__function_guard
  (get_outstanding outstanding1) outstanding1))
  (let ((o (is_ready cur_state)))
  (=>
  (and (is_ready__function_guard o cur_state) (= (= o true) (= cur_state 1)))
  (forall ((spark__branch Bool))
  (=> (= spark__branch o)
  (=> (= spark__branch true)
  (forall ((cur_state1 Int))
  (=> (= cur_state1 0)
  (forall ((o1 Int))
  (=> (= (to_rep2 (rec__pump__pump_record__price cur_pump__split_fields)) o1)
  (let ((o2 (+ outstanding o1)))
  (=> (in_range o2)
  (forall ((outstanding1 Int))
  (=> (= outstanding1 o2)
  (forall ((o3 Int))
  (=>
  (= (to_rep2 (rec__pump__pump_record__resevoir cur_pump__split_fields)) o3)
  (in_range4 (- o3 1))))))))))))))))))))))))))))))
(check-sat)
(exit)
