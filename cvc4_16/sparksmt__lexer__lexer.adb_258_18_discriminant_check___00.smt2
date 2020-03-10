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

(declare-sort token_kind 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (token_kind token_kind) Bool)

(declare-const dummy1 token_kind)

(declare-datatypes ((token_kind__ref 0))
(((token_kind__refqtmk (token_kind__content token_kind)))))
(define-fun token_kind__ref_token_kind__content__projection ((a token_kind__ref)) token_kind 
  (token_kind__content a))

(declare-fun to_rep1 (token_kind) Int)

(declare-fun of_rep1 (Int) token_kind)

;; inversion_axiom
  (assert
  (forall ((x token_kind))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x token_kind)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort name_id 0)

(declare-fun name_idqtint (name_id) Int)

;; name_id'axiom
  (assert
  (forall ((i name_id))
  (and (<= 0 (name_idqtint i)) (<= (name_idqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (name_id name_id) Bool)

(declare-const dummy2 name_id)

(declare-datatypes ((name_id__ref 0))
(((name_id__refqtmk (name_id__content name_id)))))
(define-fun name_id__ref_name_id__content__projection ((a name_id__ref)) name_id 
  (name_id__content a))

(define-fun to_rep2 ((x name_id)) Int (name_idqtint x))

(declare-fun of_rep2 (Int) name_id)

;; inversion_axiom
  (assert
  (forall ((x name_id))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x name_id)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__lexer__token__kind token_kind)))))
(define-fun us_split_discrs_rec__lexer__token__kind__projection ((a us_split_discrs)) token_kind 
  (rec__lexer__token__kind a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__lexer__token__line natural)(rec__lexer__token__col natural)(rec__lexer__token__length natural)(rec__lexer__token__value name_id)))))
(define-fun us_split_fields_rec__lexer__token__line__projection ((a us_split_fields)) natural 
  (rec__lexer__token__line a))

(define-fun us_split_fields_rec__lexer__token__col__projection ((a us_split_fields)) natural 
  (rec__lexer__token__col a))

(define-fun us_split_fields_rec__lexer__token__length__projection ((a us_split_fields)) natural 
  (rec__lexer__token__length a))

(define-fun us_split_fields_rec__lexer__token__value__projection ((a us_split_fields)) name_id 
  (rec__lexer__token__value a))

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

(define-fun lexer__token__value__pred ((a us_rep)) Bool (and
                                                        (<= 3 (to_rep1
                                                              (rec__lexer__token__kind
                                                              (us_split_discrs1
                                                              a))))
                                                        (<= (to_rep1
                                                            (rec__lexer__token__kind
                                                            (us_split_discrs1
                                                            a))) 8)))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__lexer__token__kind (us_split_discrs1 a))) 
                        (to_rep1
                        (rec__lexer__token__kind (us_split_discrs1 b))))
                        (and
                        (and
                        (= (to_rep
                           (rec__lexer__token__line (us_split_fields1 a))) 
                        (to_rep
                        (rec__lexer__token__line (us_split_fields1 b))))
                        (= (to_rep
                           (rec__lexer__token__col (us_split_fields1 a))) 
                        (to_rep
                        (rec__lexer__token__col (us_split_fields1 b)))))
                        (and
                        (= (to_rep
                           (rec__lexer__token__length (us_split_fields1 a))) 
                        (to_rep
                        (rec__lexer__token__length (us_split_fields1 b))))
                        (=> (lexer__token__value__pred a)
                        (= (to_rep2
                           (rec__lexer__token__value (us_split_fields1 a))) 
                        (to_rep2
                        (rec__lexer__token__value (us_split_fields1 b))))))))
                   true false))

(define-fun in_range4 ((rec__lexer__token__kind1 Int)
  (a us_split_discrs)) Bool (= rec__lexer__token__kind1 (to_rep1
                                                        (rec__lexer__token__kind
                                                        a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const lexer__token__kind__first__bit Int)

(declare-const lexer__token__kind__last__bit Int)

(declare-const lexer__token__kind__position Int)

;; lexer__token__kind__first__bit_axiom
  (assert (<= 0 lexer__token__kind__first__bit))

;; lexer__token__kind__last__bit_axiom
  (assert (< lexer__token__kind__first__bit lexer__token__kind__last__bit))

;; lexer__token__kind__position_axiom
  (assert (<= 0 lexer__token__kind__position))

(declare-const lexer__token__line__first__bit Int)

(declare-const lexer__token__line__last__bit Int)

(declare-const lexer__token__line__position Int)

;; lexer__token__line__first__bit_axiom
  (assert (<= 0 lexer__token__line__first__bit))

;; lexer__token__line__last__bit_axiom
  (assert (< lexer__token__line__first__bit lexer__token__line__last__bit))

;; lexer__token__line__position_axiom
  (assert (<= 0 lexer__token__line__position))

(declare-const lexer__token__col__first__bit Int)

(declare-const lexer__token__col__last__bit Int)

(declare-const lexer__token__col__position Int)

;; lexer__token__col__first__bit_axiom
  (assert (<= 0 lexer__token__col__first__bit))

;; lexer__token__col__last__bit_axiom
  (assert (< lexer__token__col__first__bit lexer__token__col__last__bit))

;; lexer__token__col__position_axiom
  (assert (<= 0 lexer__token__col__position))

(declare-const lexer__token__length__first__bit Int)

(declare-const lexer__token__length__last__bit Int)

(declare-const lexer__token__length__position Int)

;; lexer__token__length__first__bit_axiom
  (assert (<= 0 lexer__token__length__first__bit))

;; lexer__token__length__last__bit_axiom
  (assert
  (< lexer__token__length__first__bit lexer__token__length__last__bit))

;; lexer__token__length__position_axiom
  (assert (<= 0 lexer__token__length__position))

(declare-const lexer__token__value__first__bit Int)

(declare-const lexer__token__value__last__bit Int)

(declare-const lexer__token__value__position Int)

;; lexer__token__value__first__bit_axiom
  (assert (<= 0 lexer__token__value__first__bit))

;; lexer__token__value__last__bit_axiom
  (assert (< lexer__token__value__first__bit lexer__token__value__last__bit))

;; lexer__token__value__position_axiom
  (assert (<= 0 lexer__token__value__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((token__ref 0))
(((token__refqtmk (token__content us_rep)))))
(define-fun token__ref_token__content__projection ((a token__ref)) us_rep 
  (token__content a))

(declare-const t__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_195 us_rep)
  (temp___skip_top_level_196 Bool)) Bool (= (to_rep1
                                            (rec__lexer__token__kind
                                            (us_split_discrs1
                                            temp___expr_195))) 0))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const kind Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const r19b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r22b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant1 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 8)) (in_range2 temp___expr_172)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const lexer__token__kind__first__bit1 Int)

(declare-const lexer__token__kind__last__bit1 Int)

(declare-const lexer__token__kind__position1 Int)

;; lexer__token__kind__first__bit_axiom
  (assert (<= 0 lexer__token__kind__first__bit1))

;; lexer__token__kind__last__bit_axiom
  (assert (< lexer__token__kind__first__bit1 lexer__token__kind__last__bit1))

;; lexer__token__kind__position_axiom
  (assert (<= 0 lexer__token__kind__position1))

(declare-const lexer__token__value__first__bit1 Int)

(declare-const lexer__token__value__last__bit1 Int)

(declare-const lexer__token__value__position1 Int)

;; lexer__token__value__first__bit_axiom
  (assert (<= 0 lexer__token__value__first__bit1))

;; lexer__token__value__last__bit_axiom
  (assert
  (< lexer__token__value__first__bit1 lexer__token__value__last__bit1))

;; lexer__token__value__position_axiom
  (assert (<= 0 lexer__token__value__position1))

(declare-const lexer__token__line__first__bit1 Int)

(declare-const lexer__token__line__last__bit1 Int)

(declare-const lexer__token__line__position1 Int)

;; lexer__token__line__first__bit_axiom
  (assert (<= 0 lexer__token__line__first__bit1))

;; lexer__token__line__last__bit_axiom
  (assert (< lexer__token__line__first__bit1 lexer__token__line__last__bit1))

;; lexer__token__line__position_axiom
  (assert (<= 0 lexer__token__line__position1))

(declare-const lexer__token__col__first__bit1 Int)

(declare-const lexer__token__col__last__bit1 Int)

(declare-const lexer__token__col__position1 Int)

;; lexer__token__col__first__bit_axiom
  (assert (<= 0 lexer__token__col__first__bit1))

;; lexer__token__col__last__bit_axiom
  (assert (< lexer__token__col__first__bit1 lexer__token__col__last__bit1))

;; lexer__token__col__position_axiom
  (assert (<= 0 lexer__token__col__position1))

(declare-const lexer__token__length__first__bit1 Int)

(declare-const lexer__token__length__last__bit1 Int)

(declare-const lexer__token__length__position1 Int)

;; lexer__token__length__first__bit_axiom
  (assert (<= 0 lexer__token__length__first__bit1))

;; lexer__token__length__last__bit_axiom
  (assert
  (< lexer__token__length__first__bit1 lexer__token__length__last__bit1))

;; lexer__token__length__position_axiom
  (assert (<= 0 lexer__token__length__position1))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t20b__ref 0))
(((t20b__refqtmk (t20b__content us_rep)))))
(define-fun t20b__ref_t20b__content__projection ((a t20b__ref)) us_rep 
  (t20b__content a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const lexer__token__kind__first__bit2 Int)

(declare-const lexer__token__kind__last__bit2 Int)

(declare-const lexer__token__kind__position2 Int)

;; lexer__token__kind__first__bit_axiom
  (assert (<= 0 lexer__token__kind__first__bit2))

;; lexer__token__kind__last__bit_axiom
  (assert (< lexer__token__kind__first__bit2 lexer__token__kind__last__bit2))

;; lexer__token__kind__position_axiom
  (assert (<= 0 lexer__token__kind__position2))

(declare-const lexer__token__value__first__bit2 Int)

(declare-const lexer__token__value__last__bit2 Int)

(declare-const lexer__token__value__position2 Int)

;; lexer__token__value__first__bit_axiom
  (assert (<= 0 lexer__token__value__first__bit2))

;; lexer__token__value__last__bit_axiom
  (assert
  (< lexer__token__value__first__bit2 lexer__token__value__last__bit2))

;; lexer__token__value__position_axiom
  (assert (<= 0 lexer__token__value__position2))

(declare-const lexer__token__line__first__bit2 Int)

(declare-const lexer__token__line__last__bit2 Int)

(declare-const lexer__token__line__position2 Int)

;; lexer__token__line__first__bit_axiom
  (assert (<= 0 lexer__token__line__first__bit2))

;; lexer__token__line__last__bit_axiom
  (assert (< lexer__token__line__first__bit2 lexer__token__line__last__bit2))

;; lexer__token__line__position_axiom
  (assert (<= 0 lexer__token__line__position2))

(declare-const lexer__token__col__first__bit2 Int)

(declare-const lexer__token__col__last__bit2 Int)

(declare-const lexer__token__col__position2 Int)

;; lexer__token__col__first__bit_axiom
  (assert (<= 0 lexer__token__col__first__bit2))

;; lexer__token__col__last__bit_axiom
  (assert (< lexer__token__col__first__bit2 lexer__token__col__last__bit2))

;; lexer__token__col__position_axiom
  (assert (<= 0 lexer__token__col__position2))

(declare-const lexer__token__length__first__bit2 Int)

(declare-const lexer__token__length__last__bit2 Int)

(declare-const lexer__token__length__position2 Int)

;; lexer__token__length__first__bit_axiom
  (assert (<= 0 lexer__token__length__first__bit2))

;; lexer__token__length__last__bit_axiom
  (assert
  (< lexer__token__length__first__bit2 lexer__token__length__last__bit2))

;; lexer__token__length__position_axiom
  (assert (<= 0 lexer__token__length__position2))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t23b__ref 0))
(((t23b__refqtmk (t23b__content us_rep)))))
(define-fun t23b__ref_t23b__content__projection ((a t23b__ref)) us_rep 
  (t23b__content a))

(define-fun dynamic_invariant2 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_186)))

(assert
;; defqtvc
 ;; File "lexer.adb", line 244, characters 0-0
  (not
  (forall ((t__split_discrs token_kind) (first_line Int) (first_col Int)
  (spark__branch Bool) (lexer__read_token__new_token__R19b__assume Int)
  (o natural) (o1 natural) (o2 token_kind))
  (=> (dynamic_invariant first_line true false true true)
  (=> (= (to_rep o1) first_line)
  (=> (dynamic_invariant first_col true false true true)
  (=> (= (to_rep o) first_col)
  (=> (dynamic_invariant1 kind true false true true)
  (=> (not (= t__attr__constrained true))
  (=> (or (= kind 1) (= kind 2))
  (=> (= spark__branch (ite (= kind 1) true false))
  (=> (= spark__branch true)
  (=>
  (= (to_rep1 t__split_discrs) lexer__read_token__new_token__R19b__assume)
  (=> (= lexer__read_token__new_token__R19b__assume r19b)
  (=> (dynamic_invariant1 r19b true false true true)
  (=> (= (to_rep1 o2) 1)
  (=> (= t__attr__constrained true) (= o2 t__split_discrs))))))))))))))))))
(check-sat)
(exit)
